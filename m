Return-Path: <linux-gpio+bounces-15441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E48A2A7DF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4CC81882DDE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 11:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE0F214209;
	Thu,  6 Feb 2025 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hPEV/y90"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F65226535
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842394; cv=none; b=Vbf+A2ls9T9yJBQEhyhfXd7B3rUCcRygxrd3QJOLpsFDZsYTJM6/sGd/KwQtdNDyuI+0WioTSTQBUhaDxSejeIl0sDqqHuPgLkkSn9RunZzX6wLBVj57v778GQAvB84MNNtqtyPxmH7KeOGZsr8B0A6bo9Y6yXPOY9Q/RjpZSMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842394; c=relaxed/simple;
	bh=SWLeWEosbUy80lmFYLGxuNYrhdqQAQNo1/a0CmehxD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GavRnMueb+nQpLbMtvR0IZnLs56x9uMkffmgpyERh/lPvv/ujDq2Cz4PsGxe1oev09/GpluP8uIQjw2HpiHsT+REtOmscToRJDflVrRVNjsmGYeddP18qxHvrufR0uo0TcW4awumYpX7Fq+bJcKu34sfacAP6DqaRS56wdv3W7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hPEV/y90; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436341f575fso8763565e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 03:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842390; x=1739447190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+k8Ga6Qst85KoJ7YqADf5P3tQdSviLmFNQm0uA5O60=;
        b=hPEV/y90AwpDPMiMgpbbzA/h+iceM37is8+IsJLhQtx7itTItiIM4fl4+dUXBQBBmM
         hEJ8epQhQO73nvibHQ4z4R1KjXv2dpCG06HGW/xW590SebWlLRaTNpQZd1VcXeKwovgn
         ssjSG94JKPgwzG+D31v+OeAu8eM2cZTQBua038XMJldVVMaTbaTDELM7JIAOwELItCPq
         HEeFQGG3qU6xwn8itZxygycrnyhPI6RV1Dy6WYjNqcUyHbEvzn0hUZsZwDVqx/1K5Qg6
         DITQyFCVeqxIFOAI1G4uF5qMkOTza1C63/5iObDna2aPVHKvCTtN75JH4r62n2RX0s3A
         8dPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842390; x=1739447190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+k8Ga6Qst85KoJ7YqADf5P3tQdSviLmFNQm0uA5O60=;
        b=pMet5ixUteDUFfWG0ZXVBCgLrG6Yy2rxNFoSRAxmeZw2MdPjpylmKp4orm5JI/QKKK
         zKgVbxSoKZyeKCzQbgfnzd07wKynHZdCOfQ54jfm5u4MZqGzfoOyTsKmFpT0+xnISIip
         UokS2zY+tJvAAJ1O/5sKG+otg4mot5DaTVS40s5mG7cJWgPe1WmLZxHs9PFhKiziQK+l
         7SuIiatdf7BzAI2LcfCpE8L0RK5x00u/Sn5Wj/py+DU/AdQ3PcNkPIwWTGvz5GT4sfMl
         Jl3h0CUNRT+PwaiO8EoImYAJNwK1Ku66zhx9pTn/EPzQxw9EnRc1KhHS8u4T7JaxV2LB
         lSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr4t0kMkqVNxRTUdM/ELodMjFw3oPQHaS6DIk0eB/lcgsNrUrhEVn6KuFP11jlDBueJv7Gv2FL70tK@vger.kernel.org
X-Gm-Message-State: AOJu0YwENTb5kwcEug2QQ/QOeQuzatXYAhO2TCeh5dEeamT0bz29jSlB
	2M0iiY/TN7SOM+0W+B1Sr+imTZsKf59Beo4QDl3wtY/K11TQVLbRrqIwz1Qq6xQ=
X-Gm-Gg: ASbGncvDEyIDTkJTSOcYOuUFxsJUJjY9wpw6sVBZPzQ4b6kjgaXfins+0071aqkyD0G
	RcL6uuO8oawd2pVpNCD7ASZpWZifZHVKTU4QWvF3Sp2dv3ObWVWPrFZ7fdwNRX85bETK8z+0GAn
	SnT0Cu6/VMHVIwRplui0QHUf4dNML/K0NzR1UWzKbltWPCAXEUTolTcoVdapL/34I69MFhheXU1
	jZcS6du4VhqyfJVNr8ZR7wQD2mDq9N7iaUZAm4EwUPOaMyTaHWAHZsGbVcGogdz3X4pHzIE3alB
	wVpVAewLNsjx80WMTSf2
X-Google-Smtp-Source: AGHT+IEErhO90EdplG1wZoluik8CF2AbSDTMnm0SPZkrxbnqggqrDc2mlAX4JRbsHtEmSfgQX/5rGA==
X-Received: by 2002:a5d:6acb:0:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-38db4912832mr4737364f8f.46.1738842390567;
        Thu, 06 Feb 2025 03:46:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbdd55656sm1542702f8f.50.2025.02.06.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:46:30 -0800 (PST)
Date: Thu, 6 Feb 2025 14:46:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <119bdeb3-f1d4-4f35-bff3-190eccc7c325@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
 <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>

On Thu, Feb 06, 2025 at 02:40:11PM +0300, Dan Carpenter wrote:
> On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
> > Hi Dan,
> > 
> > On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
> > >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> > >> From: Peng Fan <peng.fan@nxp.com>
> > >> 
> > >> There are two cases:
> > >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> > >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> > >> is created earlier, and the fwnode device points to the scmi device,
> > >> non-i.MX platforms will never have the pinctrl supplier ready.
> > >> 
> > >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> > >> With both drivers built in, two scmi devices will be created, and both
> > >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> > >> verus.
> > >> 
> > >> Introduce machine_allowlist and machine_blocklist to allow or block
> > >> the creation of scmi devices to address above issues.
> > >> 
> > >> machine_blocklist is non-vendor protocols, but vendor has its own
> > >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> > >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> > >> allow vendor A machine, vendor B machines only allow vendor B machine.
> > >> 
> > >
> > >I think patches 2-4 should be combined into one patch.  This commit
> > 
> > They are in different subsystems, so I separate them.
> > 
> 
> I mean if the i.MX driver prevents the generic driver from working then
> we need a Fixes tag.  It really makes it simpler to understand and backport
> if they're sent as one patch.  Normally we would collect Acks from the
> maintainers who're involved and but still do it as one patch.
> 

Wait.  Just to be clear.  Does PATCH 1/4 fix that bug so that when both
are built-in then the generic driver works?  This is in some ways an
alternative way to fix the same bug as well as being a cleanup?

regards,
dan carpenter


