Return-Path: <linux-gpio+bounces-19953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF8AB380F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 15:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F1217016B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07F325C710;
	Mon, 12 May 2025 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LJvp4ISM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99582673A9
	for <linux-gpio@vger.kernel.org>; Mon, 12 May 2025 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055181; cv=none; b=F8qM6L8UpIyTtr99N9cVLI/czX1xc1m1iyosE0H+/GT/GN2a6uweeyULw8k8cWbW/5hTWNtMHCFGEld+rn+Lk1oRFDpk/lPQqsG8+WzgXsgK/rFMb/WzdRan2HL7iV05yTfHwyn+WwBj0xva3MF04jaZUobot/G74y5RO3MvxuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055181; c=relaxed/simple;
	bh=B2qswoOjLVM2nS59nvVf0KZP2T+2j2I7BmhymfLq6xs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NOAe6oCSYUIOQx6jrkpGH00xOWx7W4jZ88/NMdV+zhL3uX8jInoXGeIsXH4ntKcreaA1/1cVPSfqGOH/aTPAe3V6W0prDduCQZ1b/H0EbjqVwgjEgR55VM7BH0K3lzXLsjDhcWLseUDxFyN5uND58FEDqBV5rizpcLTjftmuHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LJvp4ISM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0b308856fso3282600f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 May 2025 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747055178; x=1747659978; darn=vger.kernel.org;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DihJy5N0sB1kkH1tX0aCbw65bN6rRxYJvuZ8x/mq9w4=;
        b=LJvp4ISMnbHKP+Qi5FnmlkvvlbY2ecnnnHK/X99xnM0R+JPgKn2smoSWV2orYe8dez
         XwLLTdH2FbxQyLdr/LEOuhKRYUADK/wgb0klbxHwOWfekXjW7dw+6jKdnFL5zNVgkjfz
         smqw2zw1rKZ5wvc1KiXv4fJAWfj2iSB6LW8Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055178; x=1747659978;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DihJy5N0sB1kkH1tX0aCbw65bN6rRxYJvuZ8x/mq9w4=;
        b=fpQ18V7JXH+ASZJekbxs4cFLodjvaumFtsLfT1JQNKkFxXra+AkI3PWmUPho15vaTf
         LEb9s0+ETbBzCIMhOyMbHEEVl8iQa639sP4YvmhP+1B0Pjy2iQdRjX8vlPH6ZYr5PMT4
         2uetfIN5yIDLuos4FFaO6qs8HndM/l0nYoJYp9L8Rn+KZPHlCSxsxk8L9DYeYHxBKCsG
         sGagCSdOWRvdiW/F5PED+y06VJluc4ifdxqKurscgARaq5rxxvv+xyU18mkxBzOT+quu
         bqMKnDxWP2YuUnPeusJc5k0Bg1IlxbDt1oKdDc/ta9+6sa01/UiUIsf3dPloWE5p1F5C
         EBow==
X-Forwarded-Encrypted: i=1; AJvYcCV+DHdLa0c1CkEJ4Pr1xcZMKo/NwkWN6IDR7atTOTZH74bfmYB5gI0vKR7N+CunEIQi9v1g97XhejbX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5Eg6/QHN4YedldPfjog7us6fh9ESWwVHtyPSHtx4ThV/95LO
	7dIMiQxa3zpvZOY97A2cXVmjjLiRU13vlAxLvthAOKzQ/nqrBtcqyqSiD3ONcw==
X-Gm-Gg: ASbGncuZgVp99VsMsVV6UM+iDLcboQ2GetP950xPCdX9YZzvdhqxOR7sbQZE3+dxxYH
	kPmbbDy92Dq9Nlv6XyMGN3iGs0FbZ4FNzMVT7Ka3iHeBSOtSx4jLREA0g8xPZgEShBw6/lh+JcF
	2Y3NRQVa8o/fXxhBz5zU8S7q+hwVLhy2FxuFUjUlys3M6UPPM7O7zwNgkheH9KdjbqUjvJRPKmq
	MUNJC7yXrI46Xd65UKS8eHhEyn7o7EQT6ASmKPf4dPvTCDs7J2rECVLuwWZYfBS0VshErP0+jkS
	kAGu8lsyYupje7d0d29HZjSaTWxt8JRbIwkFLm4snI5uG16fGsR0LTdwWg5XRlssVFL4ylUkGDY
	xT69ZhFXf92ddOmbIfMn86620HvEfHHE=
X-Google-Smtp-Source: AGHT+IFHHW+tO0oBp3s24DoLvcCzI4LBz7QAtY4LH5Z3+bpnPSagfLujXuQW5+ah6tGWIrHi6wlRcw==
X-Received: by 2002:a5d:584a:0:b0:3a1:fd60:883 with SMTP id ffacd0b85a97d-3a1fd600accmr6854719f8f.23.1747055177878;
        Mon, 12 May 2025 06:06:17 -0700 (PDT)
Received: from [127.0.0.1] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ce36sm12497030f8f.71.2025.05.12.06.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:06:17 -0700 (PDT)
Date: Mon, 12 May 2025 15:06:15 +0200
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Andrea della Porta <andrea.porta@suse.com>
CC: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, kernel-list@raspberrypi.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_-next_08/12=5D_arm64=3A_dts=3A_bcm271?=
 =?US-ASCII?Q?2=3A_Add_external_clock_for_RP1_chipset_on_Rpi5?=
In-Reply-To: <aB0d8kNVtAEoW8Ts@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com> <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com> <aBp1wye0L7swfe1H@apocalypse> <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com> <aBtqhCc-huQ8GzyK@apocalypse> <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com> <aB0d8kNVtAEoW8Ts@apocalypse>
Message-ID: <CDB01DD9-27C7-4A4D-8340-F091865876A8@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 mQENBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeTM0Tx
 qn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4GhsJrZOBru6
 rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQPcycQnYKTVpq
 E95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQKQuc39/i/Kt6XLZ/
 RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEBAAG0MEZsb3JpYW4gRmFp
 bmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPokB4QQQAQgAywUCZWl41AUJI+Jo
 +hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFrZXktdXNhZ2UtbWFza0BwZ3AuY29t
 jDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2RpbmdAcGdwLmNvbXBncG1pbWUICwkIBwMC
 AQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29tLm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYh
 BNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIExtcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc
 0ZlDsBFv91I3BbhGKI5UATbipKNqG13ZTsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm
 +hrkO5O9UEPJ8a+0553VqyoFhHqAzjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsL
 MYvLmIDNYlkhMdnnzsSUAS61WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uL
 EuTIazGrE3MahuGdjpT2IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Y
 k4nDS7OiBlu5AQ0EU8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5Lh
 qSPvk/yJdh9k4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0
 qsxmxVmUpu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6
 BdbsMWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAYkCWAQY
 AQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+obFABEp5
 Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3PN/DFWcNKcAT3
 Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16sCcFlrN8vD066RKev
 Fepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdmC2Kztm+h3Nkt9ZQLqc3w
 sPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5wDByhWHx2Ud2R7SudmT9XK1e
 0x7W7a5z11Q6vrzuED5nQvkhACEJEIExtcQpvGagFiEE1dkql+eRXN7X5HxogTG1xCm8ZqC6BwgA
 l3kRh7oozpjpG8jpO8en5CBtTl3G+OpKJK9qbQyzdCsuJ0K1qe1wZPZbP/Y+VtmqSgnExBzjStt9
 drjFBK8liPQZalp2sMlS9S7csSy6cMLF1auZubAZEqpmtpXagbtgR12YOo57Reb83F5KhtwwiWdo
 TpXRTx/nM0cHtjjrImONhP8OzVMmjem/B68NY++/qt0F5XTsP2zjd+tRLrFh3W4XEcLt1lhYmNmb
 JR/l6+vVbWAKDAtcbQ8SL2feqbPWV6VDyVKhya/EEq0xtf84qEB+4/+IjCdOzDD3kDZJo+JBkDnU
 3LBXw4WCw3QhOXY+VnhOn2EcREN7qdAKw0j9Sw==

On May 8, 2025 11:11:14 PM GMT+02:00, Andrea della Porta <andrea=2Eporta@su=
se=2Ecom> wrote:
>Hi Florian,
>
>On 19:10 Wed 07 May     , Florian Fainelli wrote:
>>=20
>>=20
>> On 5/7/2025 4:13 PM, 'Andrea della Porta' via BCM-KERNEL-FEEDBACK-LIST,=
PDL
>> wrote:
>> > Hi Florian
>> >=20
>> > On 09:32 Wed 07 May     , Florian Fainelli wrote:
>> > >=20
>> > >=20
>> > > On 5/6/2025 10:49 PM, Andrea della Porta wrote:
>> > > > Hi Florian,
>> > > >=20
>> > > > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
>> > > > > The RP1 found on Raspberry Pi 5 board needs an external crystal=
 at 50MHz=2E
>> > > > > Add clk_rp1_xosc node to provide that=2E
>> > > > >=20
>> > > > > Signed-off-by: Andrea della Porta <andrea=2Eporta@suse=2Ecom>
>> > > > > Reviewed-by: Florian Fainelli <florian=2Efainelli@broadcom=2Eco=
m>
>> > > >=20
>> > > > A gentle reminder for patches 8 through 12 of this series, which =
I guess
>> > > > would ideally be taken by you=2E Since the merge window is approa=
ching, do
>> > > > you think it's feasible to iterate a second pull request to Arnd =
with my
>> > > > patches too?
>> > > >=20
>> > > > With respect to your devicetree/next branch, my patches have the =
following
>> > > > conflicts:
>> > > >=20
>> > > > PATCH 9:
>> > > > - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b=2Edts: &pcie1 and =
&pcie2
>> > > >     reference at the end, my patch was rebased on linux-next whic=
h has them
>> > > >     while your devicetree branch has not=2E This is trivial to fi=
x too=2E
>> > > >=20
>> > > > PATCH 9 and 10:
>> > > > - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line=
 recently
>> > > >     added by Stefan's latest patch for RPi2=2E The fix is trivial=
=2E
>> > > >=20
>> > > > PATCH 11 and 12:
>> > > > - arch/arm64/configs/defconfig: just a couple of fuzz lines=2E
>> > > >=20
>> > > > Please let me know if I should resend those patches adjusted for =
your tree=2E
>> > >=20
>> > > Yes please resend them today or tomorrow so I can send them the fol=
lowing
>> > > day=2E Thanks
>> >=20
>> > Sorry, what's the best wasy to provide the updated patch 8 to 12 to y=
ou?
>> >=20
>> > 1) Resend the entire patchset (V10) with relevant patches updated
>> > 2) Send only updated patches 8 through 12 (maybe as an entirely new p=
atchset with
>> >     only those specific patches)
>>=20
>> Either of those two options would work=2E Maybe let's do option 2) in t=
he
>> interest of keeping the traffic low for people=2E
>
>Could you please take a look at this:
>
>https://lore=2Ekernel=2Eorg/all/aBxtyvI3LUaM3P00@apocalypse/#t
>
>besides patches 8 through 12, would you like to take also binding patches=
 + clock
>driver (patches 1 to 4, if Linux Walleij is not willing to take patch 2 h=
imself),
>and maybe also misc driver and its dts (patches 6 and 7 unless Greg has d=
ifferent
>ideas)? I know this is almost the entire patchset, but it's getting hard =
to escape
>the dependency maze=2E
>I'm open to any alternative solutions, more details in the link above=2E

If I am taking the whole patchset I would need maintainers to provide the =
adequate tags=2E I would prefer to only take the DT changes, with an unders=
tanding that drivers wouldn't be active unless the relevant DT entries are =
present as well=2E

I am out of the office until the end of this week, so there may be some de=
lay (more than usual) with my responses=2E

Florian

