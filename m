Return-Path: <linux-gpio+bounces-21331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46863AD4E0F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 182653A2F37
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAA02356C4;
	Wed, 11 Jun 2025 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPjLoMp1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6094521A45D
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629758; cv=none; b=e9dBFF1bH/rshx6eHd4+7QgE+S+wfbsiAEO6pOnqGdc8MY9GW9mz8lRiV4N4zbmM49zQW1+AM5euXcdbXxsXvlhJDg5GQxIFfmgj17TQyYO+Zw67Xs9MJoLFtzJ4z7MdhrLqasp9ic/y1QH1vfz679zo7dPEGv6a99jq4CnfyGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629758; c=relaxed/simple;
	bh=SVNr7xZAzK/PnbgzhDGn+m+RXROTveoQqihrLk0Jqss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ks3ab0eAxgQexdA1Y9/HUCyWvZPYAyIYm4ZMJMsl1smY4xBjfJohaYc79ljCANyFeqhNhUKahEUXKpE5O7IaND42xqOIwzaPvcpP+XN3LuXMhtw684ZDM3zJEYEvK9E+3O6OR006y8vBOg/WOLSCf27elRS0rT308PybQ0C7mNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPjLoMp1; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32a72e61a3fso6767731fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629754; x=1750234554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVNr7xZAzK/PnbgzhDGn+m+RXROTveoQqihrLk0Jqss=;
        b=FPjLoMp1W/nh1rW4DRwHlATgEVH+KGfzIeKWdc+qsVhPG0VWOApx/8I2ShQnjDQnHJ
         AVCnlGWMiVAdgdRxaSRgBuoCj9rvqdr41Sqqsoi4EBiBhsQqyvh/WsZyk+EvzO5Vh8IP
         QuMhxDRCWHcsoUOpMFyyuFG0fIrgU8X0rz94dz6QGSQEr9FrlyK/poklzBcwviYDp+be
         dAXTr2daLfvXvjrzAVY0JeCMohwEm2qd79otT8/qPU1xI0m5kL8UzgY6Njp9xBBQV7TZ
         zYcqRfidd8YpdllyUhgsxc9/LZJff6WvjOehNF8rw0beHKrEo0VXK20HegGO+hAaz60/
         vvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629754; x=1750234554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVNr7xZAzK/PnbgzhDGn+m+RXROTveoQqihrLk0Jqss=;
        b=j2uVO9lEFnXy7aMw+INKvViG6Zb+XWA9zyegdM+7aTleNhKmbTNIOnNe6cJtZNUPVC
         Nx32S+wkTixY2p/lakk0f0O/6E+6RWenq2YIdoBGsoh48ZBTtkQl7jiGip4Nux6yy5tk
         wHVebd2yS7bXoEI54P9E5I/WXWCoRIqV881kr5jYszZQLrfN2nW+SkvwMqS9n8UebiRL
         3rF/cTywhg4v3AigXS3+sPV93plAHnVxCYe8FMBd9L+zG6EHRIv3bJ0IFuXq8jKF0gKw
         fcHTATnC8hIErZHFASdPS4fwau95mUzmNcK0IyMfF46Mh5jvm8Vj8kvg9sI4FJzOWGXL
         4TsA==
X-Forwarded-Encrypted: i=1; AJvYcCWj3XuSWA81LpKRl6bIPcAf8qHzAj90xcKCehsmgQNXmpsATlFe4Th/iqOje0a6kpxe2IW3a81N2W1Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0e0Zx/oFVbeL758Mhlf2koXhw92h2iK+ub7A9Cg9kOt82yiRY
	nLqAJCw0rWhwR1B3dQIl/yTQ7+sEfWFEUA92punlPbvrJw6gSAIZ/Gqg9DQYYprc019hMFZDnBm
	fMRl6PVuIurdP1gjQ3SwNSWTnNjL7Za9Pi11JxGy3HlScS0RzAXuZfBI=
X-Gm-Gg: ASbGncvFY2u/PSKg7LWP3brL2qjJXjOeRsl7Mf+byKz4TjOmEzz49Bi9/bhzeh5jKUM
	No7wDZtS+iRqvOWdKwYNZaaBFUtL6XPYgz4wqt0BtIQeS5W/gV5m8l7GyiF5NhAQd66JXczegTI
	vCmClgtP0v/cwj7t+okIkILSvQ5gh55iSIXTsjlAW0sLw=
X-Google-Smtp-Source: AGHT+IEOGj/5GYt5c6RSKGv5q1FAx2Bj5ENiKuN45MXsdWwb9WWpzxpGFuhXfg6nzKXbCoUweT0FPKr/eI1SSRkA9Vw=
X-Received: by 2002:a05:651c:198d:b0:32a:e715:7512 with SMTP id
 38308e7fff4ca-32b210c5c90mr8161261fa.4.1749629754501; Wed, 11 Jun 2025
 01:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-2-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-2-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:15:43 +0200
X-Gm-Features: AX0GCFtQrt0tSOmXAtPeVC51VOncRYuyVTgatPuv43T2TwceDlXfbTzne2_RNq0
Message-ID: <CACRpkdZWrUezJpm-RFJ9A-P0SLmOBHVuBXn97gnvjBBnWh5TCA@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 02/15] Documentation: gpio: document the
 active_low field in the sysfs ABI
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Exported GPIO lines also have the active_low attribute which is not
> documented. Add a short mention for it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

