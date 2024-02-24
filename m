Return-Path: <linux-gpio+bounces-3735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBC8626DD
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Feb 2024 19:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D752825D9
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Feb 2024 18:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B51443AC2;
	Sat, 24 Feb 2024 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DOMAV/pZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB546450
	for <linux-gpio@vger.kernel.org>; Sat, 24 Feb 2024 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708801029; cv=none; b=W9RWNQQCO17t+1pbrR50Qk6zBFJ/NSq+4FDpBMR71m4X5eCVMGD+g6bAPseZXdxcKguvytOAh2LCFmqZbloXY6QA0xYR1MXoxGIsUTm5s81qY5rSZ2f991uL3zyxvp/x8DZLgbkn5dcXXI17GdA3/L3/FDOfKW/KrzeZSK7Iz2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708801029; c=relaxed/simple;
	bh=ZYRTKusNjhoRms5QaEKUoN2lpVAHFgTGslctrMED8L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpCzPhzvw5T2pQMCJFcPmWRyi0bGo6BW0HnbWGQg79se2YnqmQw6695M3TkIrsIuJQnfF+FHPJYfXLIuMzH+xw8Qpk1Iv/A8AO+tfNsEYh1c/mctQfSfFLenXguny4xuYbJYZ+Hk63uKIOkm2e2vZmt579X01gOKz5YqbfJY6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DOMAV/pZ; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4cba3807eedso1067233e0c.0
        for <linux-gpio@vger.kernel.org>; Sat, 24 Feb 2024 10:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708801025; x=1709405825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g6l3eAVLnBHfDxE7wyqkZmE1aw5q5MGhmCobbv8fTQ=;
        b=DOMAV/pZl+RDconUveqsZhZu5hZZyJHi7l6rJE2211hGojYGWoag0gFQ4V9LjPIm7o
         wnKPckZcsIq2HCleYjn9tSrAq1TtQ7WUSkv4xN3jnQRQM3dnuzaTiX32ThvoYI5ukTP5
         zh7kMbaBwsFzcHQfEzvHz4MGEmt4eHl3Z3QHBjkFiqzD0GRx2MXG8FMRVgIFpIpG1M2J
         uWcCetpbvSybZhLtohIg2G/O1ZVGUvKmQhCNCx8rLdaIIwvssLODUP/NY517BtTjPHXV
         xvlM1EGSAxUav4sG7jLq/UBKPuB1/MBJ1JMNsTJxm2EokBO9D/nzZcxnigEUihYEKcEI
         lrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708801025; x=1709405825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2g6l3eAVLnBHfDxE7wyqkZmE1aw5q5MGhmCobbv8fTQ=;
        b=qu2Cm9DDCVTNIm+JeYsv6rxtI6Xv/RhgnDaxFlUjx78dka89GLh/J0AfxQ2Pzku0l+
         4MGYulL8RXtv+4DAoMuGI+5e7Ueg2E8skq4N4rXRQASvYBsFLbWhf+qS0mgNXSDU4Ri4
         F/mLTEMqvuIBLReL2AtnKgOvhqqf6/f+fEIiar+sk0Ip6Dgc/JgUOdTPoLny5ttLKwc2
         8WJ5ak7hVVfcfCBNeKmH1IiExX711NAfcheTXXtBogm3pxvrY8OQeE1XmZcFpjy8a91v
         Eo25JbuodkOqZW2+fYP2m5BbdKcfcG9iHtsYuWXX2ZSBjeME1BA0VqKuTgQfK5Z3DKyt
         cnYA==
X-Forwarded-Encrypted: i=1; AJvYcCU6S+Y6G2olhkZxb/zmyN2IxmgagMMMyo5iQnwSHEv7zfERC8Wbq92cOk+YmCtotVqUDEk2KZWSNcvo3Fva4YeJRdUBwoXKNMoQXg==
X-Gm-Message-State: AOJu0YzZFCnGV6AMPE/I1IHRuzyWEnbbvVXTsMF8Ef+pebMC7uAIb1du
	cnSGJSW3SoydHSg5tDDpq6/Til0Hx+w4Nxyo8eskA6bgx2gbTXGxGe9/AxOAXd6UXTFjXKY8YRK
	7ZdV3PcrewdhPWt79SicN7l7Ig5ObAWWiwt+ZpA==
X-Google-Smtp-Source: AGHT+IEO2hrUoHhPWvohQA+K1R2xXirwjhjJF+iF5CkzSxqlZSBxnYTIfU3MNndbyuj4V3JcuzLlufJPh7rm2a9wew8=
X-Received: by 2002:a1f:dac3:0:b0:4cc:b98:43d2 with SMTP id
 r186-20020a1fdac3000000b004cc0b9843d2mr2598775vkg.4.1708801025155; Sat, 24
 Feb 2024 10:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
In-Reply-To: <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 24 Feb 2024 19:56:54 +0100
Message-ID: <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel test robot <lkp@intel.com>, "andy.shevchenko" <andy.shevchenko@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Feb 23, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git =
gpio/for-next
> > head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
> > commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mmio: Su=
pport 64-bit BE access
> > config: um-allyesconfig (https://download.01.org/0day-ci/archive/202402=
23/202402232058.4eDf4GRs-lkp@intel.com/config)
>
> UM Linux now again.
>
> gpio-mmio depends on HAS_IOMEM
> and UM Linux has set HAS_IOMEM, but
> also claims to support 64bit without providing the necessary 64bit
> io-accessors.
>
> Maybe UM Linux need to be fixed?
>
> Yours,
> Linus Walleij
>

Nah, there were other reports for the same issues, at least for x86
and alpha. I hope Andy will have some time to look into it early this
week, otherwise we'll have to revert the offending patch.

Bart

