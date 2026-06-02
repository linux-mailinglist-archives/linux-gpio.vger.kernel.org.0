Return-Path: <linux-gpio+bounces-37844-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gl0nGilOH2rKjwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37844-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 23:42:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D7632232
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 23:42:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U1ncUK8J;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37844-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37844-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 503D6301B018
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 21:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909693939B2;
	Tue,  2 Jun 2026 21:40:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96543AA1B8;
	Tue,  2 Jun 2026 21:40:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780436430; cv=none; b=Jt4jLlZzQI+TnfepUfUSOYg00eUHsK2fsWDSSxu4fOZGwgVcUsaZOjf4HoRsfiacgayqsvSUxx75EJtwH0GokgnfNOpEDbqKfevbYAcbS9LnoBwzL+b6fL353ep086JhLQYjRHRF2KVgDq6kpMxqx/uASnpUsVfkVW+2n6C+dsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780436430; c=relaxed/simple;
	bh=sb6dyPrNX2KAOZ/DxRt20MWlPqFpC3NS9PkPVODZ1Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLeRpHyH3msTjD4/ok6gqcTBFa/IkkFUia1HtKyTAWGJnNnGLNuVWKLVy2hOMSkcdGTthlGfuV/WKawuyKbJlxrV1s0BH5oPDKfR4y+4Xyw7c/nefdfsc7cPTyg14cd7r60MBTUNbh0UWlmEVOgp315lozlg79Vnjt1z738CrS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1ncUK8J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E451F00893;
	Tue,  2 Jun 2026 21:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780436428;
	bh=WsQRH3edwKKbSqJwlTIDdPj9pX96mTLjCBhiQVIVfxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U1ncUK8JsGLJR6x57+iKcFbS6DRAsyHhkoj+dgq9LLPX23+vGZP3/ByKdRWLCFHfe
	 O9cmarz2TsMxz8SVp2+u7yEjv0Y8eSsxh3WubbPkkxYNAdN8lI59VN0NaQbnlriTvY
	 gAkWbRtfMlqsYlTDRIB8RRp3bNmF2mGAl09OE2aCJwKt/t38nmVVxFyYCcMEr66Kma
	 neKGE7MUgpqIU8n36sU/NmNpFBFcXV7Xh/FRMpwSin3vK4dvVdMyPaXg59j1DKWhMN
	 y0tnwcfF/FLDFoAMLAP86SHgkDRTmpBivsHxKDbX2Mtc/sMPeTczOh0eQ4nH6aIyPg
	 VuaQizlYeHhaQ==
Message-ID: <24500088-9849-46e9-b32f-3f08c2ae6261@kernel.org>
Date: Tue, 2 Jun 2026 23:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: Remove big fat warning in
 gpiochip_get_direction()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: PRAT Maximilien <maximilien.prat@cs-soprasteria.com>,
 Linus Walleij <linusw@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <63487206f6e5a93eaf9f41784317fe99d394312f.1780399750.git.chleroy@kernel.org>
 <CAMRc=MdngQbJVQTZXvPKzFjcLOPs4=-6Jtf4Ua4AU0D+sUb9bw@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAMRc=MdngQbJVQTZXvPKzFjcLOPs4=-6Jtf4Ua4AU0D+sUb9bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37844-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[cs-soprasteria.com,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:maximilien.prat@cs-soprasteria.com,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D7D7632232



Le 02/06/2026 à 18:13, Bartosz Golaszewski a écrit :
> On Tue, Jun 2, 2026 at 1:31 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
>>
>> Since kernel v6.15 the following big fat warning is encountered when
>> reading /sys/kernel/debug/gpio, leading to kernel latency while
>> emiting the warning, and panicing on systems configured to panic on
>> warnings.
>>
>>    ------------[ cut here ]------------
>>    WARNING: drivers/gpio/gpiolib.c:423 at gpiochip_get_direction+0x3c/0x48, CPU#0: cat/12531
>>    CPU: 0 UID: 0 PID: 12531 Comm: cat Tainted: G        W           7.0.10-gitc72c39~-01802-g28c351659258 #27 PREEMPT
>>    Tainted: [W]=WARN
>>    Hardware name: MIAE 8xx 0x500000 CMPC885
>>    NIP:  c043c2f8 LR: c043d740 CTR: 00000000
>>    REGS: ca89bc20 TRAP: 0700   Tainted: G        W            (7.0.10-gitc72c39~-01802-g28c351659258)
>>    MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24004884  XER: 00000302
>>
>>    GPR00: c043f3f0 ca89bce0 c3278000 c20b5f20 0000000d 00000002 00000000 c0a76208
>>    GPR08: 00000001 00000000 cccccccd c313d830 84004884 100d815e c0a76208 c0a761f8
>>    GPR16: c0a761f4 c0a76278 1048834c 10488350 c21c0b04 c21c0d93 c0a5fb74 c313d848
>>    GPR24: c20b5f20 c21c0d94 00000000 00000000 c21c0d94 00000000 c21c0c00 c21c0b04
>>    NIP [c043c2f8] gpiochip_get_direction+0x3c/0x48
>>    LR [c043d740] gpiod_get_direction+0xa0/0x170
>>    Call Trace:
>>    [ca89bce0] [c28157e8] 0xc28157e8 (unreliable)
>>    [ca89bd10] [c043f3f0] gpiolib_seq_show+0x370/0x524
>>    [ca89bd90] [c021dd1c] seq_read_iter+0x174/0x618
>>    [ca89bdd0] [c021e260] seq_read+0xa0/0xd0
>>    [ca89be40] [c031063c] full_proxy_read+0x80/0xc4
>>    [ca89be70] [c01df3e0] vfs_read+0xb4/0x35c
>>    [ca89bee0] [c01e0180] ksys_read+0x8c/0x15c
>>    [ca89bf10] [c000dc94] system_call_exception+0x88/0x154
>>    [ca89bf30] [c00110a8] ret_from_syscall+0x0/0x28
>>    ---- interrupt: c00 at 0xfc629e8
>>    NIP:  0fc629e8 LR: 0fc62a34 CTR: 00000000
>>    REGS: ca89bf40 TRAP: 0c00   Tainted: G        W            (7.0.10-gitc72c39~-01802-g28c351659258)
>>    MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28004884  XER: 00000302
>>
>>    GPR00: 00000003 7f8df6a0 77e37540 00000003 7f8df6e8 00001000 00000000 00000000
>>    GPR08: 00000000 7f8e3efc 00000000 7f8e06f0 7f8e3efc 100d815e 7fe70e10 100d0000
>>    GPR16: 100d0000 00000001 1048834c 10488350 22000882 77e3fe68 1000596c 77e40b28
>>    GPR24: 00000000 28004884 01000000 00001000 7f8df6e8 00000003 0fde36a0 00000000
>>    NIP [0fc629e8] 0xfc629e8
>>    LR [0fc62a34] 0xfc62a34
>>    ---- interrupt: c00
>>    Code: 9421fff0 7c0802a6 90010014 7d2903a6 4e800421 2c030001 40810008 3860ffcc 80010014 38210010 7c0803a6 4e800020 <0fe00000> 3860ffa1 4e800020 81230020
>>    ---[ end trace 0000000000000000 ]---
>>
>> This is due to a WARN_ON() added by commit ec2cceadfae7 ("gpiolib:
>> normalize the return value of gc->get() on behalf of buggy drivers")
>> when the gpiochip doesn't implement get_direction() function. But
>> according to the documentation in <linux/gpio/driver.h> implementing
>> get_direction() is only a recommendation, not a requirement. And
>> regarless, WARN_ON() has no added value here, dumping all CPU
>> registers doesn't give any useful information for that case.
>>
>> Lower it to a simple warn_on_once() message.
>>
>> Fixes: ec2cceadfae7 ("gpiolib: normalize the return value of gc->get() on behalf of buggy drivers")
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> ---
> 
> Please use scripts/get_maintainers.pl.

That's what I did, what is the problem ?

$ ./scripts/get_maintainer.pl --nom --nor --nomultiline --norolestats 
--nogit --nogit-fallback 
tmp/0001-gpiolib-Remove-big-fat-warning-in-gpiochip_get_direc.patch
Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij 
<linusw@kernel.org>, Bartosz Golaszewski 
<bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
linux-kernel@vger.kernel.org

> 
> What driver are you using?

I have the following ones declared in the device tree:

			CPM1_PIO_A: gpio-controller@950 {
				#gpio-cells = <2>;
				compatible = "fsl,cpm1-pario-bank-a";
				reg = <0x950 0x10>;
				gpio-controller;
			};

			CPM1_PIO_B: gpio-controller@ab8 {
				#gpio-cells = <2>;
				compatible = "fsl,cpm1-pario-bank-b";
				reg = <0xab8 0x10>;
				gpio-controller;
			};

			CPM1_PIO_C: gpio-controller@960 {
				#gpio-cells = <2>;
				compatible = "fsl,cpm1-pario-bank-c";
				reg = <0x960 0x10>;
				interrupts = <1 2 6 9 10 11 14 15 23 24 26 31>;
				fsl,cpm1-gpio-irq-mask = <0x0fff>;
				interrupt-parent = <&CPM_PIC>;
				gpio-controller;
			};

			CPM1_PIO_D: gpio-controller@970 {
				#gpio-cells = <2>;
				compatible = "fsl,cpm1-pario-bank-d";
				reg = <0x970 0x10>;
				gpio-controller;
			};


				codec_fav: peb2466@3 {
					compatible = "infineon,peb2466";
					reg = <3>;
					clocks = <&clk_mclk>;
					clock-names = "mclk";
					spi-max-frequency = <1000000>;
					spi-cs-high;
					reset-gpios = <&rst 6 GPIO_ACTIVE_LOW>;
					#sound-dai-cells = <0>;
					sound-name-prefix = "C2";
					#gpio-cells = <2>;
					gpio-controller;
					firmware-name = "mcr-peb2466-coeffs.bin";
				};
				codec_radio: peb2466@7 {
					compatible = "infineon,peb2466";
					reg = <7>;
					clocks = <&clk_mclk>;
					clock-names = "mclk";
					spi-max-frequency = <1000000>;
					spi-cs-high;
					reset-gpios = <&rst 5 GPIO_ACTIVE_LOW>;
					#sound-dai-cells = <0>;
					sound-name-prefix = "C1";
					#gpio-cells = <2>;
					gpio-controller;
					firmware-name = "mcr-peb2466-coeffs.bin";
				};


Christophe

