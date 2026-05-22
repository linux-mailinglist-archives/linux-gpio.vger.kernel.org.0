Return-Path: <linux-gpio+bounces-37353-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IFKEwg+EGoXVQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37353-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:29:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D65B3039
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EBE83030EAC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7345A3D6484;
	Fri, 22 May 2026 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iD3bYPF9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B03D525A
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448540; cv=none; b=jpwjVuQXI3CdQZJWI9LMYY0fn6LdbHoUodFMoaDvv1yyHVM8zFxvPZMD1Bjs1HwFpOAjh5tIzTADoSDn5RbWqc1mD/6m+TM5bs+vpXEpxr3aRtVzS1W1trpQkQ41RTl7ba6jbGYTJZgnkgqnb23kOlPuvqnxNTfzPyYQHV27vuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448540; c=relaxed/simple;
	bh=LJu7pBsWT1zJXh3hVKPp/YRTnhk+qoW+ynj2rFF7uKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqYVMJV1uSTA/BqzlPIcxIdKgrdFBl6Za2IwCDLErXSFef5/ZHREz9i/sHnYowroQEnR9VA3U7pKuwvqAUfZWpaMMCy43cUOCQQISLgaf4SnZ+sMZfQn5VEjeR8qocNXxB2deUR6skQGthfknrwu/QDw531rG/Lf2M5RtuQRlWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iD3bYPF9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ea19f412aso1286025f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779448537; x=1780053337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HN/hsx6lfR44lC83hjnSLBrsWCAhLrNXnVphsYvBado=;
        b=iD3bYPF9GaOynjGiajnEjaB2avyO8o+b75xtfZYweJLPWFORU7zIr0wvjXxx6yQK8K
         K7zv4+WhYmk4153t1CIyoFGg9qd/+x6+M90OkuOqz7nBRgHZvtn0H+Kc+FNtXXDWgOb9
         vYtJUaCAjFzl/eV+lxbLnF/BmcDxiF7T9Xa4E0jJYU1RD33HgI5VAq3B9H+2x/FasriX
         R5xOcsj1Rf9dSWE2EvAcuN3Dq0DuGjOssnUIpPKvXpAVlayVHY+K5WJ9IeaCQqsKtWXd
         oBaSrxfqCWgYtL6gzYbEjDENGSU+qw/gJwAqmrErtH2nYVdd8wyFdhBHlnTRjvafGq0C
         MTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448537; x=1780053337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HN/hsx6lfR44lC83hjnSLBrsWCAhLrNXnVphsYvBado=;
        b=o+qrzLpTkM0AZDdO33cU5WR0cxf4n958Sumjrk0pp180cl9XGqZC2ZN0/z4AI/liic
         xTzS7G9yez4mFqcWjfPdkVDECBwP0nywQMfIwF7KiQopNxdddJ0UXx60BKf3saevfG6+
         c+BknPSZyzcLfOWxTtAbVELubFt2vB5mQM/NS8P0l+qzv1N+azxPjhbBP/iffBfI75/y
         c/ZL6FHHZMoHJtnFzwvaJ3KizIMQ9fer8JASXd/3w5Llpa5SelFSbxW8erCRJWzPamsR
         XrtrUdqtwDgWiG/+QxtEP4uEx1EAYyaKAINrzAFg7r0gbeq0RowZ8poXpPcMf+GAOjf6
         TaRw==
X-Forwarded-Encrypted: i=1; AFNElJ/FsffKOrN+jAOh4VkhATNPBriLVsgcwJy+/ZFxa79J8KDp+gykURzW5kAy6nj2fd736u9LvfnGJ429@vger.kernel.org
X-Gm-Message-State: AOJu0YxnwCDPcghzdtvYja9W+WFrZj98DHnAzw3cocKI8xHh2rAj3+u8
	SYvzv7LZaB4H02vP09eJxReKavaBjlL04knkBLeeu4A9wrSshXx1MgwwHtwyVZ+ErNk=
X-Gm-Gg: Acq92OH08OtLPv1k2os7E5NZTD9EHYY5EnFlaJ7C849FPIy8xbSVvj0wKJnc8ZSFZ5o
	G/AsZYoaEAlXAoWQtqfT2m6ZdOrY7bd/vGbY8n/HmxRKKXbqidBlu2Ntn9PjR3jHj2XzNjPKUfm
	OkqzlSa3jBDSH9tc1/ZRBFmmMlN64hpnBIbK5keh8c/eDAejQb7jkVoug2HvU7vaTQuAT1EbQnn
	TYoIiFYp2Orrk4BrNCvIrP3w8yOqcpblFaGhqNJHUgtix5l1KOYaRGF/7OIZmD0bpLfjrjGkPKQ
	2SI/4a6cABtDi46vsCoD16lM4DYvtxTHV97QWwuZQHfvsZSgfeqGLklLm/7i5d5r+X1kS1RHYKn
	3PhxClmo3flFPzZpXOwRywHdiBihSQleN9Nw966jM6eKk5l284e9IoAAgFUKKuJwGNwOFd2Spki
	zloY2zoL9+4SJ4oKu1Xblt1YGLeWoCCXaf9UCQcTyJNKFD15FlSw==
X-Received: by 2002:a05:6000:26d1:b0:43d:7275:c1eb with SMTP id ffacd0b85a97d-45eb38e4a5cmr4530608f8f.39.1779448536777;
        Fri, 22 May 2026 04:15:36 -0700 (PDT)
Received: from linaro.org ([77.64.147.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm3407569f8f.30.2026.05.22.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:15:36 -0700 (PDT)
Date: Fri, 22 May 2026 13:15:04 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
Message-ID: <ahA6uEon1BNg0rsl@linaro.org>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
 <771a8f63-90d1-45b5-960e-342d9041fc4d@oss.qualcomm.com>
 <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37353-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 549D65B3039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:49:22PM +0100, Konrad Dybcio wrote:
> On 3/13/26 7:40 AM, Maulik Shah (mkshah) wrote:
> > On 3/13/2026 7:52 AM, Dmitry Baryshkov wrote:
> >> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
> 
> [...]
> 
> >>> All the SoCs so far default uses pass through mode with the exception of
> >>
> >> Is it something that must be configured by the bootloaders?
> > 
> > yes, currently changing the the mode can be done from secure world either at boot
> > or after boot via scm write.
> 
> ..which won't work on almost any X1E devices, except CRD and IOT..
> 

FWIW: The "actively-maintained" X1E Windows laptops (e.g. T14s, Dell
XPS) have received support for the new SCM call through BIOS updates
sometime last year when the BSP was upgraded. There will, however,
always be devices that are stuck at their original launch time BIOS,
unfortunately. Those will not be able to use the SCM call.

> >>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> >>> boards whereas it may be set to pass through mode for IoT-EVK.
> >>>
> >>> There is no way to read which current mode it is set to and make PDC work
> >>> in respective mode as the read access is not opened up for non secure
> >>> world. There is though write access opened up via SCM write API to set the
> >>> mode.
> >>
> >> What are going to loose? The ability to latch the wakeup sources on the
> >> CRD?
> > 
> > CXPC (SoC level low power mode) would be lost if the device can not wake up from GPIO wakeup sources.
> 
> To the best of my understanding, that's only because your approach chooses
> to ignore supporting the secondary controller mode and force-reconfigure,
> since GPIO wakeup functionality is otherwise available regardless of the
> mode.
> 
> >>> Configure PDC mode to pass through mode for all x1e based boards via SCM
> >>> write.
> >>
> >> Would it make sense to always use the secondary mode instead?
> > 
> > No, it would not make sense to support the secondary mode in Linux.
> 
> Why?
> 
> [...]
> 
> >>> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
> >>> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
> >>> +		 *	  monitoring GPIO IRQs which may be needed to wake
> >>> +		 *	  the SoC from low power mode.
> >>
> >> This doesn't quite match the description of "latches the GPIO IRQs".
> > 
> > It does, PDC would continue to still latch the GPIO IRQs (as the mode change failed)
> > but PDC won't forward them to parent GIC as they are masked at PDC with __pdc_mask_intr().
> 
> Can you not refrain from masking them then, and clear them upon reception,
> with a write to IRQ_i_CFG[IRQ_STATUS]?
> 
> The HPG states that this mechanism is only engaged for GPIO IRQs and that
> the forwarded interrupt will be of LEVEL_HIGH type (which is what TLMM
> accepts anyway)
> 
> FWIW, some related work:
> c7984dc0a2b9 ("pinctrl: qcom: Add test case for TLMM interrupt handling")
> 

All these changes actually exist already. I created 3 different patch
sets for the PDC on X1E at some point:

 1. SCM call only with "no deep suspend wakeup" for older firmwares
 2. Support for secondary/auxiliary interrupt controller with fallback
    to SCM call if supported
 3. Unconditional use of secondary/auxiliary interrupt controller for
    all firmware versions

If I remember correctly, the preferred option in discussions with
Bjorn/Johan back then was to go with option (3). We wanted to support
all X1E laptops and the additional effort of supporting two different
interrupt handling approaches on a single platform did not seem worth
it. In addition, there were reported crashes when resuming from suspend
when using the SCM call approach (but not using the secondary interrupt
controller feature). The crashdump was pointing to unrelated SMMU
problems, but perhaps that was just coincidental. It could be perhaps
related to the recently fixed USB clock issue [1]. Not sure, but if we
end up using the SCM call we should test that to be sure.

I was not able to post these patches upstream back then because of
ongoing discussions about the errata handling etc, but I think Maulik
should have a copy of them. I was close to submitting option (3), it
passes all tlmm-test cases except one related to latching of interrupts
while disabled. The intended behavior of that is not well-defined in the
Linux API.

I pushed the latest draft to a public repo sometime last year. That repo
is not available anymore, but I have now restored the branch here:
https://github.com/stephan-gh/linux/commits/wip/x1e80100-6.15-pdc/

You can find details about the open test failure in this commit:
https://github.com/stephan-gh/linux/commit/59ca2a7335ede83e4a7cf02704dd7c469c725c14

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/36bbe3c6-e83d-48be-8a9c-9cbc5b26e064@oss.qualcomm.com/

