Return-Path: <linux-gpio+bounces-15438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE17A2A77C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189131641C8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 11:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FA9228CA2;
	Thu,  6 Feb 2025 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzaMsSzv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA12209F3F
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841487; cv=none; b=mHN1hyTpGfNTcYR4BuU9LifhX6yrbzO1+GverrjTV7JktD6aTsKa1aSB1VwQ1An6CQ56idQh1mkIaWK4wgbO8hvskkzn3sUyFhib7PEqrlss9XwUVc+2oOouKPggkM6PDPDtI6YNp4p25QW4IyrotQlzPnXQycf8pkxmV5vMJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841487; c=relaxed/simple;
	bh=zkGa5WERNlcjx9M1T5UZoFwgT0eWSaHUBpVHYuBMcKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E22fOHwtENdvNfjHoyL1pFRkH7E+xQhk92DJnNnmUbzyUs9Wr2m6dhvx5XDEUJXJi67eBHVHFXyHpf071KpB0vAmulBlbUf7UYQtRjWUloAPMBe1REtN4qjxQD1s33ZJJu1/gEwe6psz++UHp8MnaH8PtrydpI2kc7aBdtFOVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzaMsSzv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4363ae65100so8735815e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 03:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738841483; x=1739446283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=tzaMsSzvxHK88gKeBut+8lVTlpUXmExyLGu7Y4BC1fHp205y9bAzJkO2pn73BmfCcA
         /Y2gcuHR25JsIqW0b9QesD3U5/ssCY3tleGBqE/aBAMRm2UVxLek960vrDNae7qftnUs
         3iWFwe3Bi0oSFiobSPvY5ci33X0Ei5s7DUThV5F3wcvAahan97nptEVdu539MDH838BU
         6Jd2PHNfrNtG7cPRcKEt6FFgkwAZFTtBevG1wo6/dxS84JYuCWAS7vkqrfvfaiovyTrE
         jPDSTUwteTDDGbzwrBFeBkN1e5UPhVXCu9o1Rbfr8eBreNOTnJNYarlpUjbR/7kCmbLh
         EPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841483; x=1739446283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=Vm/oOUpJ7mbsyKEab8/w9vRbUIkN7v8GshbLSlNrXJo+aXnxqP6daqm1E9AzYfMT+P
         9j/O/489qnUXRTwbHDWnG+XO04xGM66DvF6yu4pYyJg5PqoF0cQHDPLt6NsOAOydcXd7
         ELgTf5J21eUosqQhkN6l5rdATwfueTXrq0AsScuD1NjMXiyyNjkCaNpR8kokQTx5B1Nm
         og5laHbkZdz5p2l7Ue7NaINGKIlNKENq5TySIx90KyPTSg6ZuPhwyO7RRJv31z2o4OGX
         bsT5VjDAHqn0nVOdh63UuexzGWJo0fMzgRoUV7WaS/42DjvqfbNgNgTlabxJgwikcQ0J
         Dq0w==
X-Forwarded-Encrypted: i=1; AJvYcCWjVldOA9BkKKIBHxM28Y10lO1suqNtXB1/TIXvHxS5oomAK5A/B9G0uvOYNtJDihM+1nSsC7duTwmN@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCTgmufbrie3mQLglNynpSf3xggtUc6TXpolgo/4XB5Fv/z3x
	P//O2CGUSVo3N1sKaNBAb/imbxQA00/F5prkXvha/0AWUXd/eDcFGzJ+R+WVZR02jTHMBClLEhV
	u
X-Gm-Gg: ASbGncvlvzO8J+ShUVvRRWtsx6S0u25LXI7OqGw4NLpMdCNIRGRDq9E0RBUfURAJC3s
	IbjkNCoJ8ZZ5Jh4FZHECil4P7K+QMtnAn8a1W52GgUZ1wIYtkBR2X4jUwdfEqZgtF1qyhs7cPcj
	Ig9qYFIZKA51xoeI0js1G55dy6ZgnYBQeD1Q+OAR6eLhiAjxrQkQjYQa7ad0SEe9PrapejDh2Ag
	8Nfr88F932hcH7juKp8i8nh5B4ZasC++eOnK8ttQkhZuFQlllwkYOAI8RCpOXdRz2KBPaxKcVNu
	vi0aAjOCL8n+XR2cfEvt
X-Google-Smtp-Source: AGHT+IH7D8euabfcrwCOQjtY+IXcdW/axRayM6NaqPRFSLZQPDH+rc/cv5/qoeqeWWI69RXkq3ju1g==
X-Received: by 2002:a05:600c:1d1e:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-4390d43e471mr72311885e9.14.1738841483532;
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d96517dsm52528035e9.20.2025.02.06.03.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Date: Thu, 6 Feb 2025 14:31:19 +0300
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
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105218.GA22527@localhost.localdomain>

On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> >> --- a/drivers/firmware/arm_scmi/bus.c
> >> +++ b/drivers/firmware/arm_scmi/bus.c
> >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> >>  	device_unregister(&scmi_dev->dev);
> >>  }
> >>  
> >> +static int
> >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> >> +		       int protocol, const char *name)
> >> +{
> >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> >
> >I don't love this...  It seems like an hack.  Could we put a flag
> >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> >because that's what we're passing to this function).
> 
> This means when creating scmi_device, a flag needs to be set which requires
> to extend scmi_device_id to include a flag entry or else.
> 
> As below in scmi-cpufreq.c
> { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> 

Yeah, I like that.

-	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
+	if (scmi_dev->flags & SCMI_FWNODE_NO) {

Or we could do something like "if (scmi_dev->no_fwnode) {"

regards,
dan carpenter


