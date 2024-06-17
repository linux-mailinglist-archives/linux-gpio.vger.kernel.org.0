Return-Path: <linux-gpio+bounces-7487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A7690A8E1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 11:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92613286A2A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9E3190671;
	Mon, 17 Jun 2024 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3sM4XLl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE271836FC
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614813; cv=none; b=Ow8XL3QxuH2guN1qLPu6+1x/CmWLKgtbjGeB6po/m1/sLVwVtLYeVVMdjrvNJHMofLJJEwymcMxPIdus0q5zQbHpsAbowOFvOy3qgXXFf7dLj+OnkktTofIYZkv+VSXEmFbIWPEjAb6H1YkYzCMPDoft7+ZJi3ASEHDBzDKu0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614813; c=relaxed/simple;
	bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9zOlFaIp/1t0R8pyceupk6/BInAHl+vCCXjEozoTWz1GWbdDCkm0mNWjYvyhUUPSMIdt6v7lvHztSfSpNy55ZO9d4ss7sNsfKwxHrVT5rHtZRy8SMhGnmwDIp7sv5u3jSYckeW4CxkasJP0V1w8Jxm0UJNoH0adW0Qmw8nbqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M3sM4XLl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cc10b5978so158653e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718614809; x=1719219609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
        b=M3sM4XLl/5Q0V3CRwkqgQAurW4yprqo50nshziVg/WYZi9JFR+GmPVDaXS1OxKO/Et
         b1u5qLcDIYPKS34p6cYhDZm3QatFJq4yydOmrydLzwuTgTb93oGc8NYZdnxPCxLpaGDp
         2kPDQ+EcFk2WQRLAa6GoBFKCKdTWTAsVPemqaxUvCginqfwHRj2AC5eHJZpST3ppZ3br
         J6HKyAr5ByeqqD4dlnVrGDwHusROlBfL2H23vb2GL11uHVHoUpQ+hVzaVCVogsnXzHEF
         h5naa9zSVWs8YlxT6YC9X2+hvFKXa97wcSUnlDNr34EDOFI0toWZxfblkLRxWWZCU9KR
         8gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718614809; x=1719219609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
        b=edwMnLc/fR6rXaTlTp409qS/SClKO75jCzufy05riqoh+g0vobbgukw1uyY6pkBMGU
         LK4IB20fiH1PkIDjkA2hOpxUNg2wAItb7oi6zRQaJBnpr1CV2ryIhQ0d0aGkT02o014r
         RqBkDDcjLVqUbtCdUTcYeYBcBMFjkI8E193M/v+aWAhqzXWUNMmQ5C0lOBALbP5oNTVJ
         X1KVukI2yrabwJJhkKxOW5Rton9yeqbXR1XxD3hKkh97u1759Yt1kt9nBgtwaeHf1Yn4
         JaZ5TE8IIfklcAHmdnMe5Jio9xD90GjpywarNNscHW0q9jxjEr9tl5Hnj7rB4ph0knQH
         rB5A==
X-Forwarded-Encrypted: i=1; AJvYcCV0CxsSpNYgWiHquPFJojFfoIxpewVz7EIboMyF6AvEI+J+DcB35Rfb8aV7wccnibbHPQn64bCR4ABuP5mE4ZnhoZ7oex9y07FFTQ==
X-Gm-Message-State: AOJu0YyOUcmT0eC7GA8uAurcnGMh9WEV7Hv8q6OdviIMa4SwFHJQ0pd4
	9STx9qR53cnIFk55+n3oizd3P3IE8nHGZl5fubCpF8ZrpehR31+A/DghLrg96LcciewpT4bO3rp
	VL7NEPvBV00ABiWcB6ML373hUYNTJPRqGZg8XKg==
X-Google-Smtp-Source: AGHT+IG9zighTs6xvh63BukgGULZA+rm8EHxMlcrHikHKdNririru1xtsssJ0ZWvnvp2q2oJd7kXO4xZ0dX+3hN0oTY=
X-Received: by 2002:ac2:5a4b:0:b0:52c:884f:5a31 with SMTP id
 2adb3069b0e04-52ca6e6dc0fmr6141428e87.30.1718614809351; Mon, 17 Jun 2024
 02:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
In-Reply-To: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 10:59:58 +0200
Message-ID: <CACRpkdY9aRr+OisO3Bs5-p7gtF_PbGh9MbWnyuURXSuMBW34Nw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 6:21=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:

> When ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/bcm/pin=
ctrl-bcm4908.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl=
-mcp23s08_i2c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl=
-mcp23s08_spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl=
-mcp23s08.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/meson/p=
inctrl-meson.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes many meson drivers which, although they did not produce
> a warning with the x86 allmodconfig configuration, may cause this
> warning with ARM or ARM64 configurations.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied.

Yours,
Linus Walleij

