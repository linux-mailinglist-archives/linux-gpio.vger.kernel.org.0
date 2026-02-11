Return-Path: <linux-gpio+bounces-31575-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEMwLqnOi2nebQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31575-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 01:34:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9A12054E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 01:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAC77304C046
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 00:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0C720010A;
	Wed, 11 Feb 2026 00:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQRaVrdl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D31E22E9
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 00:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770770084; cv=none; b=L0QDIM6QB4oqcC1BDum50j8Uio1d0Lz42sRx8gY6mut1orKExQfxZfaQMeOoiM4l//eivSCjUguIQLw0+ma6OrgkxURikdG1+FBhrIdM4R0MyVu1EhMPBQjInNqIUXA+eyVd6b4sDO4glE3swUZBx0xyCUEBqQ6ayWg+One1/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770770084; c=relaxed/simple;
	bh=bTtpRgxfW/n6ZJjf6LdyiaKudHmd2TDOMxlHxgHc+5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVg0s1dYaMpLHL5ouHwE1wKwEwdmvYNFcMs6I2ZgxWWOzHVy8b7A206Wu0ZqOHx1N0dN7mbLkinRFZq7tlmD17YsC45kfv4nQWW+AfWTmc5N4QPmn0hO+ADGd+RFTc/8NoYtIjymzIczSS3K6HWzrqQ2Z6rnEo9DhRou+dX0Ci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQRaVrdl; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-896f8feee14so32284936d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 16:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770770082; x=1771374882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Boz6edoyIZU5smuJ/AF0BDFHkWzkwO1KjaswJcr0sLw=;
        b=MQRaVrdlkckPZ6pKHh+rMMg9oBPTPO0Lm829GnnIvc7noaA6d3mR/3TUGZXwkjuyhG
         KKMcLlcyLCRUW5ABXKFepuF26VARLRgQjsfizSYmA2aMgEw8cIglCCfYYc7QXLi62Sf1
         v5gnFBu9a3ORqtt5N+NqP6m8+uSe6x/F12s+jSL8Vf0hjniZYyjVtwATPKl24F9blxix
         o6D92aJni2wYkdj8dDJ+hd2LHm8bfr4XIc4D397aRRxqQR/cyhSZC9arS5DAr37gdOsX
         k6seLLN8HDMUaMMDDbUvkDQmnOG+Wkk4SnOLnzqhp4mGsaambfVf1XreExcoWiAwntyY
         03XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770770082; x=1771374882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Boz6edoyIZU5smuJ/AF0BDFHkWzkwO1KjaswJcr0sLw=;
        b=nHzm6FIyFssiUxaQ+VecNR9n6sxgBLjc36hIc61772g8C785lzy+sFFoN/5uVNVoN8
         ub0L+mfq1HkPJa995hUnbR6FMeQY75bd5OmHYAXKwwyXfKK/JI8+x7gOCs/s2sqAIpOv
         Y3pZl3EMkQZ2V3RlaZv7T5ParaWzQYRKjjrwM8FYU7uHQlWM9w5q5bEK5puNmBd4egos
         UUdQw3MLq+3tEJnPch56S+FIkw+PCBfOnnIZcavBkwlBseAa/LK6YjeqjUWhPVS2J8/h
         4sFslWrBSCZHoQ2f5iBHIpdU/OENn+0/J7pVRp29CodP8lPlOtumOTwY4snyLOhSlDDs
         ta4A==
X-Forwarded-Encrypted: i=1; AJvYcCWhJEQ1KJUDiW2Bns2ex3Hp5NK164dpgAmO85A0s4mlNcXcuXU/O3sUevyGsggFRsT6S5Pak8F5ejiG@vger.kernel.org
X-Gm-Message-State: AOJu0YziBsOfj6wOs6Z2pfJmCVCjsY8iFsrLmZU3oqptxNFziyOaf2iM
	9SZJcw61rVz1b5eaKjzKDezw5P+HbdZemBZIXYJeJmpUws6ArmbkJ1Z7
X-Gm-Gg: AZuq6aJpiqw+BYozY/Dw4zeLpGcH0vCt2sWHJRssx6KZjxszgpQ+uOpzgFYhH5gF+0Z
	im/09Najt2nBE8K3dUeJUi6EwuPLMabn87GERJkeRw+uTADEl1YgktDdV8qczAbAY54upygx0zC
	UCHUe17u4nkhVcio+VqEREmQjWN6RPQHggIfTmHeyzZTmFiBVOWRMOpy/S4j2hO6lr10XENg1wR
	a7PCuxUyqfXV3H5EMD2VZYxa2l2sH9MWh4jrZ/HVTiKkK58zVswp0y3hfAk2GwqUK0UIryp70Bz
	jY83k21uOruLgHHASBlU4U4+bD98I8mtXvdOCoa57+ShfTDe3XQurIa8gzgDU0neHn3ususuFGx
	IBWFO1B6mqQtHvo606wSO+w8vMlyC6BLsQaE6DHFuRxfZc4NIBy0PMmn9pukKshZEJfICF9JCMn
	8KJ7XN0eHn8dM0pelelsyHN6hJ9A==
X-Received: by 2002:a05:6214:19e2:b0:894:64c1:6643 with SMTP id 6a1803df08f44-8970e258895mr59874666d6.19.1770770082188;
        Tue, 10 Feb 2026 16:34:42 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc823a4sm2104246d6.8.2026.02.10.16.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:34:41 -0800 (PST)
Date: Tue, 10 Feb 2026 19:35:09 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: add sdm670 lpi tlmm
Message-ID: <aYvOvYPDnAfYUk_w@rdacayan>
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-3-mailingradian@gmail.com>
 <5fa188b3-d060-4513-bda3-6608a9bdd7ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fa188b3-d060-4513-bda3-6608a9bdd7ef@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31575-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CB9A12054E
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:08:19AM +0100, Konrad Dybcio wrote:
> On 2/10/26 3:11 AM, Richard Acayan wrote:
> > The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> > pins related to audio. Add the driver for this.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> 
> [...]
> 
> > +const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
> > +	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
> > +
> > +	LPI_PINGROUP(8, LPI_NO_SLEW, _, _, sec_tdm, _),
> 
> "i2s1_clk"
> 
> > +	LPI_PINGROUP(9, LPI_NO_SLEW, _, _, sec_tdm, _),
> 
> "i2s1_ws"
> 
> > +	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, sec_tdm_din),
> 
> "i2s1_data"
> 
> > +	LPI_PINGROUP(11, LPI_NO_SLEW, _, sec_tdm_dout, _, _),
> 
> "i2s1_data"

What are the pinfunc numbers for these? Or are the pinfuncs the same
between I2S and TDM?

> > +
> > +	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
> > +	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
> > +
> > +	LPI_PINGROUP(18, LPI_NO_SLEW, _, pdm_clk, _, _),
> 
> "slimbus_clk"

Again, what pinfunc? Is PDM, the protocol between analog and digital
codec, using the SLIM clock?

