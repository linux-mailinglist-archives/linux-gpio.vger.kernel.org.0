Return-Path: <linux-gpio+bounces-36238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI+sGIwf+mkJJgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:49:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C894D1A1F
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9623046F9C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 16:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F068949253C;
	Tue,  5 May 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JkAevuNr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853B492530
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999599; cv=none; b=llsWWXxD0lRhz2i1kPsRhWqSre9NQfnVLtW4IZ0tD1F+gS9tKpTUtdzVOAfKoMjGyxREkqzMOCGHfkTHCUTf8MXHfHHRF7Gs48Ev0p4mKZlFLPWA4c1dK4+AK53UtlvqHUUuann5D0YYgVTrbMVzbBF1ZUoE+mr42HyOI8t//I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999599; c=relaxed/simple;
	bh=lP8GSMfbSOdPUQu2yG23BWNhx5HOEezwIqDOAMp/G78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvw0uQ9ZYEhNYFrbN4/BF5MdPUxoAANvYdig1n7gn15VQ2T/3O4aCE9d15VaB+hfKQkfqrs9OqvFSNaDztrNtzSYU0KYHa5aK/hK84wKD9zjTUprwA9RT7rdIs4Xq7rbAhMVORBdNKufGP91KEbcaPFgLXbkL0YikNla32/Ic6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JkAevuNr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bd5e373d07so49328487b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999597; x=1778604397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=JkAevuNruhd/yKdOlNO/Zb4RDcsdJSG8b3alVSqro2WqzsHTZqjrgeqGwWn2qboD0R
         Vvg10QJ5eul0ZaRcVdACZe4ej6YQ6+ykfGXbLrDof53cKOyGDxvQFOXpyBJ+2JgLVEdw
         CmpVDaZfiR0KHOvghsUBqRSnDsIhdmcqGpqEKij3Mk++aVjWT9/l7oNgAwcNdv4WrqzR
         VKOV4rioDm/xd4aAmUWWAdto+cotpCAZ+6rYpyPyqRF1zOt4OeqzKXizhKTimcDgL49s
         DVZZn78TEwa/SfVNS6gcZBT2+EQL3ju7rQ3KLi2V0oDD5NG3pvX1PUlHpZ2sENlL3aJA
         TQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999597; x=1778604397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=ZMVGf+MWWSIRvKpJ7uz6fLAPHDuAkQGA9U07Au6eFSqUajUOjHHveo8eFFF5kE+0Ty
         9jrCBWHMNAf/t3uoL5fAJVcN9QWUKW6JStDn5jlrqxRUNbDOsZC+SowPmAlOJ7VQhFOx
         0ZA+tWCyYodK+u0q+GX3/Y4vxemKcjvATJ0T4KmTF9p7WX8lvLhM3Rx1fVYMSVZi6JB7
         dl55smHts5+ZvRr/kYlpREdYGBnQN6eqvvWbaUXrJ3EbNs3YvTzOUe5XXXhBQ8D2QbNH
         hHBQrelXfrd208Zq2lXYv7ol+MBcXlkBka3vnBGLacpcdfzmjPamGI3mOpZUZ9vijZvc
         MmHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fGjfM1V2ZrciNEF/BDBs+9GFb6v6kEcVm5wwMA8ATapDNJRifK2vCJHUUsObzMJ7dQp2w91H0NNhv@vger.kernel.org
X-Gm-Message-State: AOJu0YyspqyfxIMLwiPWAP7ukxYxejAAn13HeBgt5/+vmhvQTijUc+mX
	veDMGGC7CJZnl1GCEzU3BtvilRTMRD2qUmc7RU3VnG0RzRJ1a+vZtwNn3In86uONVyc=
X-Gm-Gg: AeBDiesyw5gKl/5bQ5wJP8b0Lp9EAwSHW1NhnY6XD9b8H9Qw/5qmMlFpL7lFz8BtNVS
	1vgxR9RbIJfQhEYqmzXfvpWPeVNXdJSTrba9NdFIt0LnkkYKqh//oEIOSGw7ST+bc9ZN/RUMhhD
	O1LdID/A90TZPBpe/ORy+7P0rBW0lIU+0I9L6KCjKtzEOH0TIoXhzvv5t+3Z4jws9k29NqxPKpR
	ge0Xun75r0fvwHMzZr9lawtAmt8jGcGPKQIKvDGlUCGMDosAVCfVTyhzwb3iX7oNjnQPt6sz6T5
	BSxkPeVWGvsYS67ICmQMf0X9E5XKkWbqa0Gv1tjikU6m+8p10er93UIyr6ghcvF49+cvPgzv5lC
	YEHsiXVJGpSMbSRCdaIsASt5gBz6UuI3QX0C2v4d5963Rp2F2vKX6ox3H510abrz29w9ZouKHpM
	ZLGcblhgLZKj/SWlPJnmv7XevB0f84oHzyhkR94+WQJgmBpu0pKXz75LXTwzc3mKU1lMwHQPPET
	w==
X-Received: by 2002:a05:690c:60c4:b0:7bd:8cb2:4fa4 with SMTP id 00721157ae682-7bdac5ffe89mr42184327b3.39.1777999596609;
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66558f35sm66666507b3.15.2026.05.05.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Message-ID: <c716efe3-1b60-4a82-8fcf-1928c0233d64@riscstar.com>
Date: Tue, 5 May 2026 11:46:33 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B5C894D1A1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36238-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url,riscstar.com:mid,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim]

On 5/5/26 11:42 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
>> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
>>
>> There are multiple builds of RB3Gen2 with components included/excluded.
>> That means whether or not there is a phy attached to eMAC0 depends on
>> the exact board. However all versions include a TC9564 combined with a
>> single QCS8081 attached to eMAC1.
>>
>> Add properties to the existing PCI nodes to describe how the TC9564 and
>> QCS8081 are connected to each other (and to the host SoC).
>>
>> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
>> binding, but checkpatch.pl doesn't recognize that.)
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

OK, I'll fix that too.  Thanks a lot Ayaan.

					-Alex

> 
> 	Ayaan


