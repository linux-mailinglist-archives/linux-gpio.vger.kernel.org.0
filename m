Return-Path: <linux-gpio+bounces-22530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4773AF034D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 21:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995694E13E2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 19:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8312E26E6FE;
	Tue,  1 Jul 2025 19:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wi4IbO0e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA3E27EFF7
	for <linux-gpio@vger.kernel.org>; Tue,  1 Jul 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396656; cv=none; b=eosP+FsOBoSrRrMX17/FRd6diHcs1zdy6fKfioX/p5Ox4VD+HBGIBo9LX6H7aUXFqMfwOUa/Ow0oVV9mo5//u9tAofn7GTkfUoodPws5VPU8oHWFvQAn0CuUqpsTuUJ7oMZu6i/y7JD5aDsIDCWyEPKVblP3wmyxHja5FBf6rng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396656; c=relaxed/simple;
	bh=tdMUAe5SXwK2+HqDWwEF+ff83QQq+x5NhkU7fbGpGLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBtKLL6rn0iAXEhF+ahDMUDn7YGt2+rnOCaCE0R6I+mNCJo/tMkVpKNa7N1L1wu2Kd1dE5xAmPPx9sBI27ay/bGyRP27Fj4fLGxZc7d+bxEYCSCQ5dHzuNsPQOZCjbdpJqOw3/Osjjq6JcP6aN71St/fZkfb/pGnPe6SfpoFR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wi4IbO0e; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso3695867fac.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jul 2025 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751396653; x=1752001453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEK3EncUVMtlip1R7eb2kLN0bNbNbxBTXXQymbbA6E8=;
        b=Wi4IbO0eVmzFTdq6qgZqyLfx9Ac4KETYqVo7987Vy11SmbdhcJX675R9C+3to902gm
         cdMJncn1FV1alw8ei9DWLUDlq5mdmThUhgcs7k5ufn24FjYuvjijDsNfw04jHW3/TQ9j
         hTG+McyFBZs5S7EVGhRKR6CrI4Al0xdd+2aENXjnfIsANYF+LaJpJQW4IgG3bGAXDx8c
         smjbOtNj9VfiqyVbXyJyaXq47yamzLMPjyVc9Yh9ZgQKPNTQf52eWjdLssR/BuQ2Wkx4
         dHAKX9HONsow38l0z379caXDINRDfyutp6DxiMNBCMrXKQ56RLvgIs0bysBImNEPNt07
         +VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396653; x=1752001453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEK3EncUVMtlip1R7eb2kLN0bNbNbxBTXXQymbbA6E8=;
        b=xRcW+c4E/InLqYRCtsMOOn5IKH5Yprgf1rju7rQKP4WJfjxEeGv8Wtyuc1eYC9uKVl
         mGs7V+xLvJ6bhmXIwtnIhwONeZuNy4V0uytLqjAG6aPiWfigUcyv/ycFf1Gm6w+9zKyi
         ENxMqZIJsUbI+pg0wFCp2E16TfLxB6E2xce0j3/cfu4kv0Jy9wdq14o8b2HIEZxdav4+
         Y0Gxb6X+Ktg8wNnWCuMZGXD189k1qQMZdzdaNbdy1gAhDN3LTm/ABwRP3kbCHpY90M35
         Jky31R3OwbIrOxsL8SOhKfnEbdDIAMIRR8SFvqdktiQMn6TqlXOLgLsACJGzgemmfAD0
         ejVw==
X-Forwarded-Encrypted: i=1; AJvYcCUXcYJydNiAbYagBJuzcHLnNQg9Btld7MN8ZZvEyQd9pmyqGxPyw6ZuKCrsFwZ0iCvMEA0Grxc4OJq1@vger.kernel.org
X-Gm-Message-State: AOJu0YzRbpH53XxpHrfFDRTUMNavjts7L/y5kGE34TonJuxuHTF9FZ5M
	lTiEizUPZJsJrkv4Xu31D5mb25OOuI0h2iQzo/rJw2g780WMuyHTlQSdjaRnF1GMTm4=
X-Gm-Gg: ASbGncv7fpIeaj/paoMI+BLf7/FVHzLscAoOB0I4GUv/9ckWXxM5ZNeDfy0oK5rifEC
	/PoPtrPgdxx9EAtaCDr4ign5f0sTBhGOBYRs8pmBCSg7Yae/6vveVZwwyRzFjiBY80jO0EUPH+F
	ZVq9kW9drpH05fRkL3sFpPYROi1lp2G47S6h1Qw9Rm7OzDkGq+kM+ZxnbwIkleSxL8vXn6iGxDe
	0/+HGjCMfVi3kVQFEwxv2vRBekhAWjkrIVP0uiophM9VkdywbCx6ZDihPYEfO0OJLF59pGWds4g
	8h0RH5ofg7IwI9vJ8/VyS59cNxkyfUVjr7fL5VhpnSX1QrksMor9Fw/jiEywdAxjJsyRKg==
X-Google-Smtp-Source: AGHT+IHDxUr1xC3O4B3KUwXveX27ECu3+OaL0Y+zUBHu9uWrNi0sz8Q+GhGn5hs1DTYqhbsigADOQg==
X-Received: by 2002:a05:6870:8614:b0:2e9:e2e6:4a20 with SMTP id 586e51a60fabf-2efed4b8854mr12938843fac.16.1751396652741;
        Tue, 01 Jul 2025 12:04:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea5a35sm3456703fac.2.2025.07.01.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:04:12 -0700 (PDT)
Date: Tue, 1 Jul 2025 22:04:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <496f817d-802a-4889-a7dd-155d51895d16@suswa.mountain>
References: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
 <aGOqmd5cvCeBjWMI@apocalypse>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGOqmd5cvCeBjWMI@apocalypse>

On Tue, Jul 01, 2025 at 11:30:01AM +0200, Andrea della Porta wrote:
> We really can't get rid of that warning by replacing ENOTSUPP with
> EOPNOTSUPP because the core pinctrl code still rely on the 'wrong'
> define

Ah good.  Thanks for the explanation.  I'm glad I didn't try "fix" it
then.  :)

> like this excerpt from drivers/pinctrl/pinconf-generic.c:
> 
> ...
> 	if (gname)
> 		ret = pin_config_group_get(dev_name(pctldev->dev),
> 					   gname, &config);
> 	else
> 		ret = pin_config_get_for_pin(pctldev, pin, &config);
> 	/* These are legal errors */
> 	if (ret == -EINVAL || ret == -ENOTSUPP)
> 		continue;
> ...
> 
> Also, many drivers still rely on ENOTSUPP. Maybe a patch that will
> fix all of them at once (drivers and core code) is in order, I have
> it in my todo list, indeed.
> Besides that,
> 
> Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!

regards,
dan carpenter


