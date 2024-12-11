Return-Path: <linux-gpio+bounces-13752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C689ECC7E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 13:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C153161038
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 12:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ED323FD0D;
	Wed, 11 Dec 2024 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A4glr2YT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4D23FD03
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733921236; cv=none; b=EAkq4/eWatRAh/1/vXSNcNeuoATNOi6F7n1z0aZIJlwwTR1r9J+PfXJnI4Z8GIff/mOculHwUqmkFVrMIlXuT/FEiotW9eu1LJfB2vEX+bseIR+ED636c+Qatfsy0MmKxfqYdWPutLKdpqTrkgHILkbRKwghdDfJ2r2pStcfyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733921236; c=relaxed/simple;
	bh=y4fFjXVJEqMPSzqTtHUfPs3UdSK1mcztnZsQtSm47+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NfVzL9KhnwlwVS7cPb37GWhTBKgdOqdsEG6HNDKmpr3TRZ/Itb4K84X2X9Vr/rrJOHMzS9OvY+YoeeNZj+hnF3gBBsx709bBD/dDT/xTRmea9pR/wyiGjg3f21P0nzpoSAFxOSIe/a+a8dAIP36pI/RgZhBtLAIXnMDzCgk50CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A4glr2YT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43618283dedso14602495e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 04:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733921232; x=1734526032; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6kTL5GB3PSflSCTwDuuseKTZXYkA6ilPyaKtT0Vb3Q=;
        b=A4glr2YT3dF5MT0ppVgN1uxyc8ZEmDhbs+miVrK2mqPsyfunY2tKyfkRoEz6MHHxWe
         NCUGbXoRDxbYsSKxsdMyEmU62MriXe3cvWoJ2Trt2CY5o/tBdtAV24iD2/xreLGshXZU
         BC+jMW/gTd3RtN+nFdNL8Q8ukjrBlpPL/9Di+hHxIQeoOAqUJzwXF83LG5VouJ8dXxts
         t3rcvtfy1OjnZ7MUGgvv629De7sow4DUrWTN2XCm2EDMDagEtzujsvbAdfxZ1foCABli
         Ohs0dnKRQegPqFrSvFG/2ZDzWG4IbXGoZnsTlQpQ1Y7NqPIakIYOXgGndlnJJ2Yrv2RZ
         M4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921232; x=1734526032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6kTL5GB3PSflSCTwDuuseKTZXYkA6ilPyaKtT0Vb3Q=;
        b=FsUNnpqHMZKRFeb3FY1jQTMpwSm4wcmvpbZvdGdE2V6Ho3xiSnJOmpAaLf4zzoukNc
         zaWTWhTJF++s2Q2awcBCIl/REo4ND8cKLxc41loqqv20lHp7iuIk8s+OmcS3yPy3rVQW
         pxmA5Wgt5mHJM8S2fq4PwdJ4tnc+Jv/feveT3uOtfpEI21QsJXBOf+vNR0A+uKJ+XqAt
         Twyk9aROQwHV2Tf/RyGDcWUnMm8QTREue/60O4XqOZEwwlPiHbmDw0yUpiGaNbpBbYdd
         YZL3y3SL+0T981yfXIimqIfdwYtJ4r0zNbDrmxbJH6FmjHAeko7DScxrToE1agxExOtx
         hEvQ==
X-Gm-Message-State: AOJu0YwioqU+o/VQtimy0dNNO9QzBu6Ynf+hiChzCAgQtuKbLncJrnj9
	JCzEuy5vOsYhilbfnxHMHfuh3RCNMUi9YbODkzOKn1utCWPAT0ANGMScK6xPjQw=
X-Gm-Gg: ASbGnctGerEmWQFpwUy2dusCcWfgsvRw1kiyvheHGRLvka45gpFduRX9ybybDbn9j/W
	5KU2gfltJDU7swodkS15x3Ip4z4JHge3n9tv/wEgnlKs420Kwbc+3s95jyA1P0G/FL5gPOfjQR9
	OAIDoYoap2mPlrEj+k4e0Xv52Y7/97Ast7PHctlXafbBQ28mfOQBtMJAicaoA3imrG+YQmnvkm3
	caTkCRn6k3lfClHEhh2cIvOkihYWPNpBoy/Wfw9hMppZNK+OeOHvPHLejQ=
X-Google-Smtp-Source: AGHT+IH//IzWLugAUc3CYh/VIxHlw6qP2T6DZC6sKJMxzT4hkTRkIeqgIQeidADCa09S0+JpfYYSEA==
X-Received: by 2002:a5d:6da6:0:b0:37d:4647:154e with SMTP id ffacd0b85a97d-3864ce85edbmr1995303f8f.9.1733921232463;
        Wed, 11 Dec 2024 04:47:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514eabsm1230212f8f.70.2024.12.11.04.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 04:47:11 -0800 (PST)
Date: Wed, 11 Dec 2024 15:47:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] pinmux: Use sequential access to access desc->pinmux
 data
Message-ID: <d70ad7a2-8a69-462d-9f92-13f0d76da51f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mukesh Ojha,

Commit 5a3e85c3c397 ("pinmux: Use sequential access to access
desc->pinmux data") from Oct 15, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/pinctrl/pinmux.c:132 pin_request()
	warn: sleeping in atomic context

drivers/pinctrl/pinmux.c
    113 static int pin_request(struct pinctrl_dev *pctldev,
    114                        int pin, const char *owner,
    115                        struct pinctrl_gpio_range *gpio_range)
    116 {
    117         struct pin_desc *desc;
    118         const struct pinmux_ops *ops = pctldev->desc->pmxops;
    119         int status = -EINVAL;
    120 
    121         desc = pin_desc_get(pctldev, pin);
    122         if (desc == NULL) {
    123                 dev_err(pctldev->dev,
    124                         "pin %d is not registered so it cannot be requested\n",
    125                         pin);
    126                 goto out;
    127         }
    128 
    129         dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
    130                 pin, desc->name, owner);
    131 
--> 132         scoped_guard(mutex, &desc->mux_lock) {
                             ^^^^^
The patch adds a mutex to solve a race condition.  However the omap_hsmmc
driver potentially calls this with a spinlock held in the suspend/resume
path so it leads to a sleeping in atomic warning.

The call tree is:

omap_hsmmc_runtime_resume() <- disables preempt
-> pinctrl_select_default_state()
omap_hsmmc_runtime_suspend() <- disables preempt
-> pinctrl_pm_select_idle_state()
   -> pinctrl_select_bound_state()
      -> pinctrl_select_state()
         -> pinctrl_commit_state()
            -> pinmux_enable_setting()
               -> pin_request()

regards,
dan carpenter

