Return-Path: <linux-gpio+bounces-10746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20698E1E1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 19:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1481F24209
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8BC1D173F;
	Wed,  2 Oct 2024 17:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LLR4fxMX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717428FF
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727891421; cv=none; b=LJoUwnOz+nPuWG3nIbry90IHhMM8q7GLt8sM+bsbaCgMLXuPnErNfpOr+XLpZBMaCEwkSSlHzZIYKj1AcIfuAdss/hhvKnjcE3mXMg4jqkXecD7Aet114vmYsvzbkqGY17CFK+MsyayXpy+JbwUGQcri9wKOoNKETxegv1m44pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727891421; c=relaxed/simple;
	bh=YYvdeMU4FLJqt/LoonAwVg6UArRp9V2gNUFMiaYqIbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJQ2IRe6K07tRUfCOXrdVYv+cr56KYDu70Dhw5dlGmuvOdhOePXoXS8AmyxLKpr6vwxaohGpgufInWkonnM87SOMpgLVrSSPV10PPTCjKQK3spGC0+5UK3iXDHTm2jjirPA/b0SQbrMVGNcps5myYWD1JbLYdQ+1WmOPTK0uPi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LLR4fxMX; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so520831fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727891416; x=1728496216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYvdeMU4FLJqt/LoonAwVg6UArRp9V2gNUFMiaYqIbk=;
        b=LLR4fxMXxOYUKpygxHn5O1GnsymTdDJbtCTwOX7fZSYrGO+i9purW0W9d4YE2Ra4pZ
         HET16IffmSp4LcX6jSYVnlqOfVg0D1wLneA5QfWXO/krq+AzoX4is1f1ltrFx7O6qMv9
         gSj5vZfiq6ROhR0Y+LhLP84bpDvCr1bmNVYd4tK7x7XoTwnNvTQdJjsLYTmF5aGzHhJW
         jNCEENSvRmVaMVZGod6hMqdhnZlIg0TQZoDLSSC1u6ikPmGD7FoVjrSjeduxtjoe4xec
         bw5fc54Yz4RDVMGW70b4NI6KpsNPZf/MjVbpEIaTpzNfAsDE/7NHbNLDteUpE7pbr3EE
         3zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727891416; x=1728496216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYvdeMU4FLJqt/LoonAwVg6UArRp9V2gNUFMiaYqIbk=;
        b=MKBoX1VtylRp9uEyW4OlYe1975jkBp7xjhNmjMciZv7UBFUHXQJICQNO1pgU7iKgtT
         YWepHtuyNE0v7nC2kDedXRGMLomUr0j9M4lVOTXOTTNTIKHABygOAkmI2gQP2QTRnHDO
         f7iICb4N+jtLFIMIRIjHnMKG0uKqWsP90wVRKXX5QS71TGSAheA5NnYFztAMJAF0HUe0
         66x7sRirChV8MWFLo7W0mB7G7bTJ5VPCcNRU13SDAc5i7pcoGPKCtHis8pldLJ0iGUmo
         B1wA4YEctfLrx8s27E2pg8j7InJyB32RcqPgGI7tTZwo9yOzHmcY/bA3EBxE7Y4rsv/K
         8DJw==
X-Gm-Message-State: AOJu0YzRCPJBl4Yr8sJ7rM0CrMOWxP06Zz0pzcawvQXUuAI1gqQDoO+0
	6fNiIZH3IYipYU8VnLu1YBjO6QJyWtNkUX3tSwfebNcA/lOQkNY245b6QN9VE2hv5ubHY/X1hz1
	8w08PsGY3HN0K+zqKTT4UMk48h5yHe6p8LCPUQmIjes9hCGDO
X-Google-Smtp-Source: AGHT+IGUVOyeNffaqy+Av3cWwqOvWuvDY3cOcIE193H5WrEW0CCKjhsOp4XNyXLUeamvDe8/kUUHLMQx3yaakWACIQY=
X-Received: by 2002:a05:651c:1549:b0:2fa:d317:b777 with SMTP id
 38308e7fff4ca-2fae1023747mr26488351fa.2.1727891415812; Wed, 02 Oct 2024
 10:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
In-Reply-To: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 19:50:04 +0200
Message-ID: <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.2-rc2
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 3:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> I've just tagged and pushed out the first release candidate for libgpiod =
v2.2.
>
> It's a big release that - next to an assortment of smaller
> improvements and bug-fixes - brings in a big new feature: D-Bus daemon
> and command-line client together with GObject bindings to core
> libgpiod.
>
> It's in good enough shape to now focus on ironing out the creases and
> make it available in the following weeks.
>
> The tarball and git tree are in their usual places[1][2].
>
> Bart
>
> [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

Well, that wasn't very good, rc1 had a build issue in the tarball. I
had to fix it up and release rc2 which now builds fine in yocto.

Bart

