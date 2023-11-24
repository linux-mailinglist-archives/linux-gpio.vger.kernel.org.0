Return-Path: <linux-gpio+bounces-473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B0F7F70D1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059A21C20E9A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086F6171CE;
	Fri, 24 Nov 2023 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qxN5ioYE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438F01AB
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:07:02 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-db3fd3e971cso1623161276.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700820421; x=1701425221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWcP6gQgrwmdsnOkpH93ij3XRZvKw3Rujab02fsHwiU=;
        b=qxN5ioYEcENuAMn/Jxr8Kcg+5ZM9glWmzc3x2Wi4S+x6rIHteCtrlCsNYbUfjdtyne
         BOdb9FO72GTlLtiezDwv7z4FSZeDqFsIqJv3K7V9Er47Gp1Kz630X58BdnwoGtrxcEpe
         1tvf9tPCzQGzUdh2tt2cnuSUV/TJi8E1wS6stwjJMQBwVvYT8hxvgDAhSopsGd12KbZh
         QP2nKDWokcgtUjPWANTtF/8dgHgQlYDF6SwKsPZHxvKYIAma9EnC1co9CQ0vtrD4NJrS
         P1CSCaqZd17kLEjuFbJESHzg++yLR3jYXQ3HozJxQFwMyl1Ep+MNrCZnxXFBGc5LBp/A
         sSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820421; x=1701425221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWcP6gQgrwmdsnOkpH93ij3XRZvKw3Rujab02fsHwiU=;
        b=JJ+Nx61bwytSrbDV88OwOv9LaSZD0lWpHEI5UyI76SoNNR38O88aNIpMY3fNLJJlP+
         m2i6j/FdJvP9O4TAXc4oC6kbI+FPApxq0E/8poTAnWFC5+QJz6GlHp7vtRn1UMewRmSl
         zyjY/fB+WP12YDy1ri9SbBvU5HerCkhVkzzsSyUjX4MxTuXphCPagD7Kywaju92CTpH2
         mmp6dLL7GlB7XhWVIK/Az5mC00EPweScyk2Qm3YOlHQgMBatWwVAk/uaOxX4c9GEI3hg
         oYMXhmScdyKpBowp91UxMQHloT+IKqHT+XTWjvkkXorPB+EPXxyq2lwT3bUtsW5bzjiQ
         5sZw==
X-Gm-Message-State: AOJu0YwunDoRQbY0Fc5kPvbqAfc0SFgb835MFdkGExTbl4Eu3dpN3MjU
	hWdOMKV9wdoRUJHfXl0pqByLWh8TzP7Y1g+ZxYumcA==
X-Google-Smtp-Source: AGHT+IFSnAJD8pB6XNkHS4v3hhDyUz8bMnLEKTFJgyUyBO5NiU10+s0sV8dxVVUWj46P6kffDmIbWY6kXKt507dXHqo=
X-Received: by 2002:a81:e950:0:b0:59b:c805:de60 with SMTP id
 e16-20020a81e950000000b0059bc805de60mr2174447ywm.45.1700820421368; Fri, 24
 Nov 2023 02:07:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120222832.4063882-1-masahiroy@kernel.org>
 <20231120222832.4063882-2-masahiroy@kernel.org> <CAK7LNATK3BVDZ88v7MWjzOk3Kv8CR4Tz_k77yi1OO=zc+71j=g@mail.gmail.com>
In-Reply-To: <CAK7LNATK3BVDZ88v7MWjzOk3Kv8CR4Tz_k77yi1OO=zc+71j=g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 11:06:50 +0100
Message-ID: <CACRpkdaMBrWUR8OYLPiQNNJ64mfenFyQa9f4iB+w5kZ44WjSeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: pinconf-generic: resize the pin config array directly
To: Masahiro Yamada <masahiroy@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Tue, Nov 21, 2023 at 11:21=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> On Tue, Nov 21, 2023 at 7:28=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > pinconf_generic_parse_dt_config() allocates memory that is large enough
> > to contain all the config parameters. Then, kmemdup() copies the found
> > configs to the memory with the exact size.
> >
> > There is no need to allocate memory twice; you can directly resize the
> > initial memory using krealloc_array().
> >
> > I also changed kcalloc() to kmalloc_array() to keep the consistency wit=
h
> > krealloc_array(). This change has no impact because you do not need to
> > zero out the 'cfg' array.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Sorry, I retract this patch set.
>
> krealloc() does not save any memory
> when the new_size is smaller than the current size.

But the first part where you switch to kmalloc_array() is still a nice chan=
ge.

The fact that we use kmemdup to be able to also shrink the allocation is a
bit of an oddity I guess, but let's run this patch by Andy Shevchenko, and
ask what he thinks about simply introducing kmemdup_array() or if he
has other ideas for this.

Yours,
Linus Walleij

