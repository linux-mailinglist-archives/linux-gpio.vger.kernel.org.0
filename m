Return-Path: <linux-gpio+bounces-13285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 827999D9B2D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B33D1675B3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 16:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068761D86D6;
	Tue, 26 Nov 2024 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oh14bPNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D291CEE97;
	Tue, 26 Nov 2024 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732637841; cv=none; b=YZKf5i4wZVuhI/57tE6Jj6G0XJ/rOPczGfyoMJmSdx/4U9WTINq+dJuxMjT2TltQl8GEGEv2z4R0tCy0Q2XIxiWGr1vUGaefusGN67Wgz6P429snE3FXiJFFvP9ujXgsHNlwR/Ty9ZP1RX4tNmU+J7aa/smj+fdfUhQsbbG4WlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732637841; c=relaxed/simple;
	bh=t1uBQW+oI0CzJFAUHppB/Jtuu9jM/2ue+emxeR+cC/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRGXdU5IuA1wrLgQz37apcLk/hTmHM8fQ+9A/lDpqciZeI5J5V7gLakP57NBC19IDjyVONAPuL2+QJlCm7ZzCPT0znkM52MWkxXvctzuVE8x0VKYTCFO5CSWn+09+leFffEf89IV8B93itiuAJldmn3ldlacjgUNM7eKHg7hx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oh14bPNz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21200c749bfso57182445ad.1;
        Tue, 26 Nov 2024 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732637840; x=1733242640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dotO4c05j+1ByFMdhxgy6HIjtPrpikGEeV7kKdyEfIQ=;
        b=Oh14bPNz//MqwiITqj88jUT2TlxQobm6QUXilofq7tdIcrFmK5fGW5aNNHAfpaQ6Jp
         RvkNKzpmT2eHvJjKpo/g0ZPmJFEx0ht3tJol3HSc9Mhrl/W3CwSgnJ9ChP6shuYu+TVO
         L1K8TuZE6vS+/AWcRc1WAfqGNu6PK1uGbXX++cXXpcZec6gF6kB0C8t6LNPpHHNIQcb/
         N+wE4cPuFfVobycKsi20nxYQGGpPvBiVj4V4Ow3WfTrTin+wduC4h1eR6E/u9ergOK4j
         mHHkTKS29s438UOxvlj63EZEvQ9X1l9cXFC/iheKIeCFdh4GnU0ejyDYXh5Yz31ZrBds
         mCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732637840; x=1733242640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dotO4c05j+1ByFMdhxgy6HIjtPrpikGEeV7kKdyEfIQ=;
        b=FwW8qxqXVH7FMAAL/9YKMN7dvk5htHhpuM4Wpo2r3UIwiQtxKgc2MQQa0bVwGZfxXx
         oX2yFKn8tzrlBKoqa/kta3gKidRbkjB4V95JE17hLJ6O4GJg3yeKCbL5brmAJf+cmDgm
         +X8vjBtQqE9mWcZME9uC5nk7vfucTPzbAn57NwkhBPu8+1jk3D+f4MDOEcqZptF8BFvh
         PNRMR2/JFB2HLJqiLgBFDhBtSV2ifC9kvk5kvi+UxB+Eo/YHCybGjG3a4g/qb0krOC3E
         6UuGqQTC2ac2vPiPILx6Poeuz+RmN6K+evRQElrmxn4dojwVJHWfE+CVIghfroA19IbH
         J5qw==
X-Forwarded-Encrypted: i=1; AJvYcCXJBkGZWXcDiyM5HdW6P+U7mwi9oP8zthIFqEXEa4tdO4pJDpX0Kjn/PMLFgEeE3XXreaV42kCC7H+d@vger.kernel.org, AJvYcCXsDDe97keNxoNcwhCwdTQuIB9R92udT3oGncsB5yfnw5B+fWTYIIKD/MMlkSbWPdq2kpqF3jWX99cFV62i@vger.kernel.org
X-Gm-Message-State: AOJu0YxGKQrFkfwQV5l/hvbMIMBR5A/zQy5NYy4SwmkdagkUiUk5zRoq
	Pi0DXV5Xe1AbHCC7EvQn91yqUFjiB1fA4qDadVnHj+SqKlB9Fwz8
X-Gm-Gg: ASbGncudwNkDp/JlKsUmpYx85u249LpTVm/feUS9V4vX+n0YkDRYIMwYYmD4SebQmMV
	+ALx5EEBjpV9jn5Kx7VZHQfCkAOXaWZnbjJUON7A/tIArramkR/prbaAE7jR7/2zp18oLZhD8IA
	RZtjqgEU7bO7jCC1g11wq3P5XjlBmmKrbUBM205BQKEn23ytdWTYliMHEls2yC4piVYURxm2iIj
	SDBSj75qwjk9H8mChIIQPATwyZhqnGJ9/aAEP6Se7KANm+g88IkY/2aQJlig4U=
X-Google-Smtp-Source: AGHT+IHIE2SReZTJ4Qu4Z8qk2ImmULTwKv8+/GkwDFaH8Bgy3Ec6rGlXL8O9cvmqAvZCw7gJDtDStQ==
X-Received: by 2002:a17:903:32c1:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-2129f28f81amr257582205ad.52.1732637839561;
        Tue, 26 Nov 2024 08:17:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc22a4asm86521855ad.261.2024.11.26.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:17:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 26 Nov 2024 08:17:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Message-ID: <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>

On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:
> Making pinctrl drivers and subsequently the pinctrl framework
> user-controllable, allows building a kernel without this.
> While in many (most) cases, this could make the system unbootable, it
> does allow building smaller kernels for those situations where picntrl
> is not needed.
> 
> One such situation is when building a kernel for NXP LS1021A systems,
> which does not have run-time controllable pinctrl, so pinctrl framework
> and drivers are 100% dead-weight.
> 
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

This patch didn't update default configurations, meaning PINCTRL is now
disabled by affected configurations such as imx_v4_v5_defconfig or
imx_v6_v7_defconfig, making pretty much all imx platforms non-bootable
unless the default configuration is changed manually.

Guenter

