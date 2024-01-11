Return-Path: <linux-gpio+bounces-2143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED5F82B563
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 20:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0D12881DB
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 19:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F49B55E57;
	Thu, 11 Jan 2024 19:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVrfh2eI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982AC524AB
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbed85ec5b5so4519945276.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 11:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705002379; x=1705607179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAi2GDQ+ThdQ1lT7Cr2g77YBh1JVwDL9p52yhtkQlNo=;
        b=jVrfh2eIfKUdq1E/b3tnplpCL7xWlTRv+kslpwK32KG7qYz3NKoKPIBJRUzq4Q9vwS
         ItqcvepuwkUipMhL/N64VaRQtKdc3+1Xebvmw6gLmmVfM7u7QFFNZYyw7dhhiMLCAi2Q
         TUxxDe+3R/QHRE4j0igvqWeArlkK3I5VCCy6rZ800fGpt1sSzX0IZHnnFekFqtOAKBi9
         RwEhgvtRJqskEiiw6WWju3iZMm+/Nwp+6mL2Ttq5mrNShAjSGl+oDntsWACuvJtTXeL5
         72GTHDInGV7Qah5qsTiYhbwhj5VfphHU8DNGcnNF72GPW322wV2AT2IS0MszH2g2iuZw
         gD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705002379; x=1705607179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAi2GDQ+ThdQ1lT7Cr2g77YBh1JVwDL9p52yhtkQlNo=;
        b=R8HGuWACM0ze1+RGpxpUQObf8gY7+HoThnizbdN2aX4HQKiKbDRbH8KYdFjzlTjhqb
         t87L/dn0JhOo5QqrpRqHU/1WS755lmaUhU8pUDzjeRSAEqNLBsMySQOzBK6TGH0nLCY1
         tclWLSOaQhpHFSW7JkB+hr9sOVzXrWt0IMx5Q/ocMYdbjnjiyLzgV+w26Uxt6cXGu0K3
         XlRihl+lUMTBRbFDTARtY00/056NTSQqm5Pg9a7EXVSI6qEGck/TJ0+dmMGy3VRNuBG8
         ZVl5dqKM0Hs+WveZ1AFHfSs/vN5g22Ff8pnh4tbJXNHKQ8mMxgiNmLyF3tN8LcoFuzcG
         e3qg==
X-Gm-Message-State: AOJu0YzIx3j5+MuiBYDaedjlAq+sCh/mFDRoz8Zyiq9UEnzKtJJLgGa+
	jGG5JXqMsx9sJHjmh7ffBUMgtZ3vluWyz3ktFsUboxrRVnf3SA==
X-Google-Smtp-Source: AGHT+IHO/hbJI7uHyCOMQIngOSzow7KSL8+obEwrYolSGuUHUtXDHtI5B5XmyV1xIfhs7xwpVwi2TXyaGiDh+D7cEDw=
X-Received: by 2002:a25:74c8:0:b0:dbd:b419:1ca6 with SMTP id
 p191-20020a2574c8000000b00dbdb4191ca6mr133118ybc.82.1705002379332; Thu, 11
 Jan 2024 11:46:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111150429.681567-1-martin@kaiser.cx>
In-Reply-To: <20240111150429.681567-1-martin@kaiser.cx>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2024 20:46:07 +0100
Message-ID: <CACRpkdbxbqPKQbkDECy8-TDXpLuA1UcUhJkozioECeqm75eq8Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: allow disabling the vf610 driver
To: Martin Kaiser <martin@kaiser.cx>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 4:05=E2=80=AFPM Martin Kaiser <martin@kaiser.cx> wr=
ote:

> The vf610 gpio driver is enabled by default for all i.MX machines,
> without any option to disable it in a board-specific config file.
>
> Most i.MX chipsets have no hardware for this driver. Change the default
> to enable GPIO_VF610 for SOC_VF610 and disable it otherwise.
>
> Add a text description after the bool type, this makes the driver
> selectable by make config etc. i.MX chips other than SOC_VF610 can now
> enable the driver from their board config.
>
> Fixes: 30a35c07d9e9 ("gpio: vf610: drop the SOC_VF610 dependency for GPIO=
_VF610")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

