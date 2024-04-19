Return-Path: <linux-gpio+bounces-5686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD618AAF3E
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 15:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF2DC1F2310F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 13:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACA61272C4;
	Fri, 19 Apr 2024 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aa5bLbHd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D970786647
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713533105; cv=none; b=gL07LDZU4JKXAWxSe2R9w+9D6VEKoqpsVoLTbCfv4sWDS8N/T0FzBgJIZdIU+tpCQ7xW2hc7lJwMvgXC3zmQV238C+FVA4r3eExtQRIEh1VWE6f35Ddhvu2JigKe+fnK6+tSBMqP1NBKme6glBQu8Nr7LWp0IWWMGIO/sXpUCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713533105; c=relaxed/simple;
	bh=UWXTaQ82HyFtQb3TRUV4cf5MB8r08tl9SIn+hgm0d+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hs5Uc6KA7HAb0tdf/5ZJ/gCc4s9M1V4PdqT4nsnrTwd1Ux/5D+2QKxI6z+C82E8yjnUyCwyNE9M/Xz9AvxxiqM9JOxkklxpdGtO44FWorGgEdKhqpE6El5El6D+qfnV89JNEPwllRpw7QGDtWEFUOQsXDx/rvrDG4ET3NYgNHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aa5bLbHd; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc71031680so2084670276.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713533103; x=1714137903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkrOJ4wKG+fycpys61fJmDawiloLrXFnzq3mdhSsqRc=;
        b=aa5bLbHdbG/MRkL+K3v6q4HnJIyKyjT0PNGYQzu3xcKehSZhCBZo0Oa2STrIIHGxmI
         NYTDDIHZoVKFVSiamSwyZc86AOfpOIsn9UzsEhWUDoei/N+k2CeqKrZONtwqmJYwFtjn
         wGfloUa4qUl6S+LdV8pTsGWWZrfUk29P50IoEp4t9KHOcVz35KI3CWO3IqcCz7Z0kE1N
         Oucg0qfX3gDjuPo3fPNcf+8M7igM1XtK8XVeaOy+i+rCTjKt+e9Uy9X9LMwoFFo9WSOS
         hkT64eWbFcnhvV5hl2FFgt/1S9LdhwHvAHps+QECurjuNctvfCVrK7H5h77RkdcohOHI
         MroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713533103; x=1714137903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkrOJ4wKG+fycpys61fJmDawiloLrXFnzq3mdhSsqRc=;
        b=tTMnUECKW5p2IK6QJNKJpCqtnh8+LQ/ZgCavhSNvNNqH4wWkPwEY21u2BgEF56glqO
         rMLb2W/sVRSu6UvQhEHQC5o9lAWvov77pcal9whtrure+B5/fgUTLftjkzwNLdU2NjDB
         6a1YA41XYvVed6cyvURfUiqKGVBk6xQAnkABtdKrvyDAIWghe1wAhayD+r/1YjcePV/9
         PNJUY0a8T5XUUnCHU83II+x6bREkEJOCbq1NXjDz8edFg6flP+0Yp3cXnf4Mm9d2S00x
         E4xUpN56V4j3AVYl0+QCDjHh+oSzXmRJkhvuSr+MVQS0QKVRGbjUYpubv/npjVjUpGxb
         5I/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDkkVaIuxG+noT/kIhNoug5vJNMlE8YMOp6asZskpwcZbXhyE2cefdBnu1cPTvrcZd7X+z7+PQrKO5tO+1xJPpLoOoVvoIxTb3kQ==
X-Gm-Message-State: AOJu0YzU7j4aYe52dSaSHIA4F3P1v7Ufs68G0Aaqo5HAwr5O+g/u8NnJ
	UOUs9f+AJznWnNSkVHaQGkonjAEsxHnDg7UKcxnBTZU1JseLKxC8xY38G5Kb5wwVhawO61bOisH
	b/8FjNFLBCuE/kK17wRNNKh6+MSeM6iUuingF8A==
X-Google-Smtp-Source: AGHT+IEyyp8kZfsahZ+i2TdwPhFvo3EiP8GYbc2UBm1PxE1KueAyxKWGN/Vu8bv/kI+9tRapKwazomvLnYLu8G9C8dY=
X-Received: by 2002:a25:55:0:b0:dcc:f0a:e495 with SMTP id 82-20020a250055000000b00dcc0f0ae495mr1727089yba.3.1713533102898;
 Fri, 19 Apr 2024 06:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415105328.3651441-1-zengheng4@huawei.com>
 <Zh_rM04PspfXxlv_@smile.fi.intel.com> <d80e09d8-5f35-4865-9fe8-195b86527972@moroto.mountain>
 <ZiAC9zzSWume8063@smile.fi.intel.com> <fe83e07f-ca28-4c00-9b1b-7d16c63bad62@moroto.mountain>
In-Reply-To: <fe83e07f-ca28-4c00-9b1b-7d16c63bad62@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 15:24:52 +0200
Message-ID: <CACRpkdb2YCrG_wJtdSNhqUJt5x-fPSb4A9uaU6DmAOm3roFN0Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree: fix refcount leak in pinctrl_dt_to_map()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Zeng Heng <zengheng4@huawei.com>, 
	linux-kernel@vger.kernel.org, xiexiuqi@huawei.com, linux-gpio@vger.kernel.org, 
	weiyongjun1@huawei.com, liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 7:49=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> Probably we should add a comment to say:
>
>         /* Return -ENODEV if the property 'pinctrl-0' is not present. */

Would you mind sending a oneliner on top to fix this?

Yours,
Linus Walleij

