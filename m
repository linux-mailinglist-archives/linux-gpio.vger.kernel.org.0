Return-Path: <linux-gpio+bounces-37534-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NiDHTmNFWrUWQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37534-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:08:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6145D54E5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7D40307512B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2463F5BD0;
	Tue, 26 May 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHwwspWc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EE22DECBA
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796812; cv=none; b=PS781q17/vKnNqzs2tHhzQ21a1hPkEEUzfu6TeiYBNQZbSkO2FwSxrzB0nXT8Kg8Ef0ldeWum8Js5cGgrLuoQ2eJtP7DzAaARjg0Uq9UZYXjvnTpdhI99MuSHdh+e00/nup04gtChbqIyWHjT1jZ9aIZAvBkFj8YQ/dIpw/WEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796812; c=relaxed/simple;
	bh=hTZYyqvqtGqppwXg4HP3xZpz+TZopttkYVxm+x/q8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7Vj3tufJ9/Bq9NVE90s0O095PuHnk26gs9KwG54NyjYTuqXawYboUIFJa0AJKTfn83/aJ0WyFkSvo7n4b2ykfO1cUyE+uc3pYNgqIbCuMwH2RdPdtSIniKVycbWYHguB6NYaAzVG2KjV3PtqJcFd6jxU9bN/0xicWDVcw6rDCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHwwspWc; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd9a71b565aso1199792166b.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 05:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779796805; x=1780401605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CoKLuje7HUGv4pGCvIBQiUOeF+gz3p4jM4FxO+bIdX0=;
        b=pHwwspWcu5HViVH9PrTg3VZGKAXTnNGteSs54531z1yqAvoQ9iBT7CEw4t9D0baKUH
         byMt2zeqQnIntjhhwu20JIzFZbDq9LEAweNjSM/QJ+ooJMiyVZM+4a1VFYcCW3lUrfkm
         e+pPq1JQ46/j0lw0YAKPCxdvoLZFK2ixC8DBCGhSSXq5YXwYfElqzUSc/uNEZQpzVYeQ
         wpTxmiHgcLyVfyrHBh4ID7utw8G10oFWuFzl3TYMXdPnb8nSgtmebQ+/E1R9DXQ+hpO8
         JiaYJ2R/MmMxrJlu5caCZgP1L7gh2ei9wZmnkuPZZMArcD2gYwFM+3qbAj6//UKppe7/
         Askg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796805; x=1780401605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoKLuje7HUGv4pGCvIBQiUOeF+gz3p4jM4FxO+bIdX0=;
        b=IkKaAlT3H0d1fvsCDghf8fIsBezjAAMWT3pQ6J4WbFr0FQjueiMmMxDk2JSA6MLdAf
         tgFrLtL3aJNtZNc75hwPiOsGI+J5yzK1Y4tQT31wSEm2oNbjhOLLqX3ptpo3Gn6PF0rY
         /sNCLZQNvm39DQpDKURBrX42UtAvovTxs5z7NN/g2zBgnY9e1PUnvWByngGNv4vMGpOb
         HvtZzpEIrL6aTGWZHyRUsYyBjSM3GOSQJ7ztQsECQy05DvRcgLcVmqtFxYv4X5a01NRf
         JNslwdanFAvSbkclSLksL49BxTd8fmyDavQEPngj9OsptPWts+S22xck2JWxEq4O7Yfg
         RzjA==
X-Forwarded-Encrypted: i=1; AFNElJ+3ojUmI58piAg32E+X35e5nAUOcVDr2yQ54a9/M8TIPTEuhv9+QX+G+J6/HnPwtqBB/iUktSkE/WEt@vger.kernel.org
X-Gm-Message-State: AOJu0YyEgrHpxeR2VyKAX9rNO/F6OdEF3NAmNKfI+RR4oRnnjW6Dwku0
	yy/caurAP3p+zxPU/CJl6A/kpJfPwcCZxQdXSbVxyRUMl2Fzauo3eM+UkZjdy/iHJn0BCII3Ky2
	MRIs8
X-Gm-Gg: Acq92OE6/67HcK5AoW0Hov4EddrIo2jTuhxb3q3OqxDyw2Nbc2zxzB8C19GOaCFpugF
	nHYYkRQX1lnZbN1ozkfaZg/l4HqW5btP9+42Wuv0R03/6g8WoM0q0gfHJ2Jr1JZZR1+nJk9KDcc
	B9jpjvN/GjujIC/rwiqbYMJHGL0LElealyYkKiWVjsuWht3lnXspZoM4jiykBHDNUIC79V5lLap
	ePQVepkFz2gqpyh/TnutXPpzkhMdSSkyneK2uUDF7Vm7W6QQQqa9Mx0Lkj89tqQkX8IheqCkrE9
	7JcYA18ZSFcrJhPZwkOrWDkVmn23fFr56oSGCVCwUtrdXKzXXy10fdbnKRHETkW0KHK85llfmOc
	G/nZMurfHFoFxG9w2nVEp7RRGgxyt72tX3wjL3lnLI43JL+bltUg3cL0OMO/j6RHcdfhRlnItaO
	ojlHH7eqQHX/DZxSi4Ux6CANWNTYai
X-Received: by 2002:a17:907:a80c:b0:bd5:ec9:e063 with SMTP id a640c23a62f3a-bdd267cae6cmr1071905766b.49.1779796804514;
        Tue, 26 May 2026 05:00:04 -0700 (PDT)
Received: from linaro.org ([77.64.147.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc61de4c4sm497740166b.42.2026.05.26.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:00:04 -0700 (PDT)
Date: Tue, 26 May 2026 13:59:59 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
Message-ID: <ahWLPy8vg_neYgrX@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37534-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DA6145D54E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 04:24:36PM +0530, Maulik Shah wrote:
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
> 
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
> 
> +------------------------------------------------------------------------+
> | SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
> |----------------------------------------------------------- ------------|
> | Version         |        v2.7      |       v3.0        |       v3.2    |
> |------------------------------------------------------------------------|
> | Pass through    |        Yes       |       Yes         |       Yes     |
> |------------------------------------------------------------------------|
> | Secondary       |        No        |       Yes         |       Yes     |
> +------------------------------------------------------------------------+
> 
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
> inversion when needed for falling edge to rising edge or level low to level
> high, as the GIC do not support falling edge/level low interrupts.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs defaulted to pass through mode with the exception of some x1e.
> 
> x1e PDC may be set to secondary controller mode for builds on CRD boards
> whereas it may be set to pass through mode for IoT-EVK boards. The mode
> configuration is done in firmware and initially shipped windows firmware
> did not have SCM interface to read or modify the PDC configuration.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> As the deepest idle state as the PDC can now wake up SoC from GPIOs and
> revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
> parent for now").
> 
> The series has been tested on x1e80100 CRD with both old and new firmware
> and also on kaanapali.
> 

Tested how?

I recommend testing with the tlmm-test module Bjorn added, in all
supported configurations, to make sure you don't introduce regressions
for one of them. It would be also good to provide the test results here
in the cover letter.

Thanks,
Stephan

