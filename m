Return-Path: <linux-gpio+bounces-22665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804BAF6121
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 20:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CFE1C41EE1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 18:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79832E4990;
	Wed,  2 Jul 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWbWbvaw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF74A2E4982;
	Wed,  2 Jul 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480659; cv=none; b=OIUM65EK/X206Ug3gY7OGIExIGtFhps6TCoBIuIrlqBfdjvSLU/EqOwwOwFfivKtXyMdLFEg7tum6IYfWhkZTkMSvtNMuljEE14kU/uCG2T0WiQMZ4ZmyieVDAsC/85Gl4lzCXHgfgfo/rrSnHhx/QBOxdOzrcCwmtz2UeIlZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480659; c=relaxed/simple;
	bh=nZ+1F6TEk7oWeJEKN4ZVu5Q4tlevoBhDJYFBgn0URJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFOqh5xWSWoFPtkw/rBIJMQDKQX0+YH7UpfXvAF2xXy4IY7AQYOIZHX2FFnavONg+34vbM2ygFyIf1gO0LX/M3s4+e+7xG5MwtPLRam+pFngAHdFBENSCDTKMwwYTTMUMHXINgrCSd9RResM464JjOIj/PajZEaG4T29v/HA1lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWbWbvaw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553cf020383so7950960e87.2;
        Wed, 02 Jul 2025 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751480656; x=1752085456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ+1F6TEk7oWeJEKN4ZVu5Q4tlevoBhDJYFBgn0URJM=;
        b=WWbWbvaw5R1ug5I47o7TDN+F0IPFOIEzcbqKo/2bIhisOrvDokmyu+NPn65oPJJRUJ
         PznJO7tjs2C6XDg8moE9tcqlVpOeNZQgFLCWkQ7Fy966RgrR1Exa3OCM/0lnc9CskHc9
         d/p6YGObkynaeT+XHMTIWmd3ecRh2lD6pwfmg5Xmq3wPA4Y1RHMEUWi3XtwDJ1VYXMXu
         DEGD8yOsQC43zRxPk/3l871GxB7CXXhJoWy2MGOd87KM9h36xaFoEZALCO8Ttnza8dPa
         38cqK9oLpS2ublhu4xDS71vI4g6bwMr+sCNGimZejz+UVUJOEDlT7ZRWNlOgHy4GaqPN
         bHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480656; x=1752085456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZ+1F6TEk7oWeJEKN4ZVu5Q4tlevoBhDJYFBgn0URJM=;
        b=ULFphXWEfo3xxRnKfn3FwIBgvkCgazAPRYg0xj5mKgZhCZk+EbmOziheGqPfSM4kbb
         VHw33OT19KXKiR/vNSDGcNiyrlYZXomM+drMVmoU+jR1wvEjnB0SJgyghGfGeA57oqnJ
         P0fPTlvoAFBRUlD9YOKFLnNej2aZhcEglXjPBiZwTFqXDzIWoOxfBVkEaRRQreAPKTe+
         fz46I1S4zasJOVe2ivlOCdB6BR6epYNvtTkNH1IhgyCgTfaZ4r/j9ptFfFeNmGNQZzp+
         25ODa5Bz57RpQUSCPngXb/YRx7QJWZoheJy1G3mBiu05ZhTiaLb/1RQeH4Z+ekdZ6uIg
         EmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxARBX1Z7sJI1n3Jv+JLtnlF0VXWSXjqFYioRpa1WyNjrI5EapPnC7be/4k/q5fm28Qb0CW1qZq++4whhk@vger.kernel.org, AJvYcCW2YsFeauCY5UkAGTzkK9FM965uVxCD+cY/XdRWzm1SvDPMZS0kAnUHH/H1KcvvdDZXVx8Aw+Xv3ILW@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9LrcZDirXdxyKnvqIEfCpUbfSxZ9Lzi27mhzjaFJ73WlgzV3
	cYFoC8BDXH4WgYyIG0uZhLI102yDBSPL3LbI2o99L4Om/rChpVdCiYwO9o3EaBkaa/ovytVoQeh
	VL5zvZ6bfg05Rh2/fGi5KJMo16zX6f8Jk/LZqckI=
X-Gm-Gg: ASbGnctFSMk70WUSXwnUipqkqBSwea6lH4oqiDcWzm8FFrCjg5j/dk1O7d4R+VYp66J
	gw3oENStkrWZOjGqHeWpPQXXe55GWKLHbX43vhdk7Ka7E0DAH+/TvKAxsRx+zzMqKCFlAezW2mU
	gzbJPwSSkonAvZCMF926ZFJ1ze5hioAnUrr+xC84QUhPvOcqR5KEw6bg==
X-Google-Smtp-Source: AGHT+IGBo9uAcINK55geEglffhPkpoqDNkbKPVdcnpj899nCHB9kZ1kBf2BGUQdSZCeztG3ZYr69TX9kaw2go5H26Gw=
X-Received: by 2002:a05:6512:230c:b0:553:da39:38a with SMTP id
 2adb3069b0e04-55628225641mr1593326e87.7.1751480655667; Wed, 02 Jul 2025
 11:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-gpio-palmas-gpio-v3-1-e04633e0bc54@gmail.com> <CAMRc=Md4YP6fp5fnFf5p+EkSamg15dDUgxgeY+E1OqteiEPRJQ@mail.gmail.com>
In-Reply-To: <CAMRc=Md4YP6fp5fnFf5p+EkSamg15dDUgxgeY+E1OqteiEPRJQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 2 Jul 2025 13:24:04 -0500
X-Gm-Features: Ac12FXwu0_aB_I5lFg_5a_iXJ7o7gtM6Q5Sctt9CdNjf9KymXtVjK_WR6YGvlbk
Message-ID: <CALHNRZ9kdwZikx=3J2UDKw4bTg9vD4t77_yN+JydeLHCifozRw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: palmas: Allow building as a module
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Wed, Jul 2, 2025 at 7:56=E2=80=AFAM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The driver works fine as a module, so allowing building as such. This
> > adds an exit handler to support module unload.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> This doesn't apply on top of linux-next.

Sent a v4 rebased on next-20250702. It rebased cleanly though, so I
don't know why it wouldn't apply for you.

Aaron

