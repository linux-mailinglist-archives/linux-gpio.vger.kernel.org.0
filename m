Return-Path: <linux-gpio+bounces-5074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF28985DF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 13:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0607B282B94
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99FF8174C;
	Thu,  4 Apr 2024 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jckYf/K3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0867F7580B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712229468; cv=none; b=qcCERS4s+absMFpOHEp2qgyMWC0PDB1S96Sa2z2L86P04U0gmHgz/vkvtq183EOmKjqYbjx2yenhER1D7Q80bJbSQlkywAwZlWQCkPHqJT9Q7TKikb+WIV9iXefDUhG79mSZ/vcMlh9i9Yg61qRap2hEEKGD/R59qbEqFkE29Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712229468; c=relaxed/simple;
	bh=o2/TKZRPzxKISKIjt6gJsBAoZL76Iizy3+HohxXMm1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbrjDTNdi77bdDxxhfrEPbdVbME4IM2T5zOr22mWQs3cUkJTXIdBSLTbmeQXYgilj7R87wjQCbPrWKZ6QgcHd5V3Fxwl+rdb48vukNUhJqn3ZvFJ9kmlDMADTy/+CG5w63Sb6A+FbJEtbZqwIRC/3CEKjzLwErnIgKAN7wOF6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jckYf/K3; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dde0b30ebe2so848602276.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712229466; x=1712834266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2/TKZRPzxKISKIjt6gJsBAoZL76Iizy3+HohxXMm1k=;
        b=jckYf/K3quZSpAv3rg7b2GDVY73pXJwRviiJ0v7UrkY6+gERV+LwpNlsLIrDzLxrEi
         2NFmeoH0wkFOFX1mRcwGIPJykOzDhdMmk4vq2MnlTcsGQKp9CH7HiJGzGYjholnSXBCE
         FGvFktEedZ/x3fwSCio4ML6kMIz63nONDfvp6d0+tJ55EMDUc0n7oO74XjRmZFBk11rZ
         zjgbYpu6v6edmelQhGQARw1UZaH90cCaEXH+VoDwpl0JnhAe9xRhSSocK4VRZNnB2vWB
         9KCt5tTx7fFfdK3hokOao0e3GvKhE2dBDPQTYJYfXaQUPMnAkTXVFL3Y1he8bEHpGIP6
         tY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712229466; x=1712834266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2/TKZRPzxKISKIjt6gJsBAoZL76Iizy3+HohxXMm1k=;
        b=PMV5mkZvJfUatue0mqSbgK8cWzDHQmKXbyahd/3a30y0rOOaYUofA+0vy6zqcAgzJS
         dBVUq9ykC7EXkrOfPM3xo6u1ZkprI1vsOdu9/Mf5v+8Bn2pjjkmOHJxdyHCEevJb4gsi
         nRn74vXs6qLqNWjXFacOalAU5jL+dzWqCwaQbYvKLRVaanJ33qVGJP7cgkcv8yEgwWEo
         snAXGbKKmnBczKAbM1N9+X0WzEbNnKY7HUmUP/D9wlwZ56Cs70daqvgmZ3Ft/bwUnkrH
         liQS3R2cVEPC1C9y+gUoCxfQuafeiG/plQXWG7JyvI05gzA5heAwEFGJ0tUgFNcmbPGa
         Ma2A==
X-Forwarded-Encrypted: i=1; AJvYcCXeR/b8R2K2SI3F/xWIadCX+ELxeRaU20GK+/FxqD9xn9+NacnGl4xZKccK45ftTRBdxBBQbR9dEPcmPnZuvxnqGDfDH3X0LvZgJQ==
X-Gm-Message-State: AOJu0YxGo+mMy6NB026+CJ5QmFfeL04dPmS/0AOj9Glp9x6U/K98YKw1
	NcQTi8pMUcj2XY2F0cOZE9YV04K35qNSSDYTab/r3ijo0F91cur47sLjXON/GTmuGIWScg16q55
	zLEgSaODe0vRLbzU05m/veMoc/oY50Fiwv2SNGQ==
X-Google-Smtp-Source: AGHT+IFbAfIVVH0ufOCH4t+iyy2AAsXNLXy/3qJv8Q6aR01Ii7ui3YwwGAvilR6gG4EdbWMZ6vEsWPHbdr9OH1g2yBI=
X-Received: by 2002:a05:6902:4a:b0:dcf:3f11:633a with SMTP id
 m10-20020a056902004a00b00dcf3f11633amr1992020ybh.35.1712229466011; Thu, 04
 Apr 2024 04:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329105634.712457-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240329105634.712457-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:17:34 +0200
Message-ID: <CACRpkdaLh6wO2mGBWSeqHPMW-CXj09o5fParzmRAyFM52jnz_g@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] aw9523: number of cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 11:56=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Just noticed that the newly introduced driver has some leftovers or unnee=
ded
> customisation. Hence this series. It may (or may not :-) be sent as an up=
date
> for v6.9 cycle, but TBH there is nothing functional critical.

Patches applied as low urgency fixes, thanks Andy!

Yours,
Linus Walleij

