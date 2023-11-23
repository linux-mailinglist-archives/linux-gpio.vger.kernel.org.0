Return-Path: <linux-gpio+bounces-409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1317F6219
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 15:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D9C51C211E0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEB422F0D;
	Thu, 23 Nov 2023 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTY/PLMp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1507D53
	for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:54:16 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a877e0f0d8so15959267b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700751256; x=1701356056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQCVfDsgWY/zTEVOFXIzheR2Sa3G525xrhmxUR9vYaY=;
        b=xTY/PLMpFbaFomzwHNSLOdlofBOgPClhPWKODikwkx3YFfRsqgS+hI9UCEW93DJ7KX
         h+8y1RKlHZpt5yFkzM+BbuXjzOQpFZjqlpwn5+XH14+N7o4iWLF9PdS15kUTE9n+Unmy
         8rqxy31EHiZCU3XyG8fF5G98qJEDPJg+wYq2LClQKmNd/MC9zbrEdtPRx5JrATlAfxNa
         X7cunmGJp3VNOramYg2XGSSsQmpOgff+KeGnbTJXSLWr/YtajIxNDcab080kwfd9PLoZ
         VGgVg+xLwIdHJK/DcNT+mwCGqx4yT2PhAdq+2hhbJHz7bInb346istmKe+DreM5/mpaO
         Xrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751256; x=1701356056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQCVfDsgWY/zTEVOFXIzheR2Sa3G525xrhmxUR9vYaY=;
        b=fTdMWn6GO46m6RtPeBwbd8uPlIvS8GiFYrmfT+Fi0WQOOjf+Mdlog2qNKyDeubFMlj
         n3XUKdNNtcSCYV78R5spEfKtDkb/cpeDyysVPSumg8pGOgXN8IlkeNHVM9ScfBaQgacW
         /+mzf+R93zQWcjyZKNgVuPCgiUOMAXjCFAGHf5l2kS/iECaTLCGdahK/c7lePV2LqN+k
         7vzNWqvL5F0Ogrs9pnsKhFAz+VeUpoYlIffBiOn0DXEW8sra9rnXlbNbgb+zIndW5HBQ
         VuIjGYj1tFa5VcJSlDDG7gZ3tHMy6NJK8G+PXeNEfp/89W1xCSwJ41AQX4aKY5LGfISj
         bDzA==
X-Gm-Message-State: AOJu0Yxg56k/g1Xs245ENp5CS38KRW0ddEpzkm5ll23zzMIvZLjuX6WD
	whotmBNdeqFhZdT6hk7DZiIuwIxx14rPfcQrEXDqwg==
X-Google-Smtp-Source: AGHT+IH7Rd4xWDlbVC5YrXQiBqLegP0WAhDlB1Gbob2IIRXsUjvJ1TZmETFwS+DNwRNcvADWUlL5b8s7EMfqmgNxeBU=
X-Received: by 2002:a81:4fcd:0:b0:5cc:dfdf:7f40 with SMTP id
 d196-20020a814fcd000000b005ccdfdf7f40mr2326675ywb.2.1700751256151; Thu, 23
 Nov 2023 06:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com> <20231122175039.2289945-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231122175039.2289945-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Nov 2023 15:54:04 +0100
Message-ID: <CACRpkdY8Crm1TVf_6kCZ1EhizymaxU6g4ik2UOYBoqLf8XBCLA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] pinctrl: baytrail: Move default strength
 assignment to a switch-case
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 6:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> iWhen ->pin_config_set() is called from the GPIO library (assumed
> GpioIo() ACPI resource), the argument can be 1, when, for example,
> PullDefault is provided. In such case we supply sane default in
> the driver. Move that default assingment to a switch-case, so
> it will be consolidated in one place.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

