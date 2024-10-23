Return-Path: <linux-gpio+bounces-11843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3EA9AC701
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 11:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E1D1F2158B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 09:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56142194136;
	Wed, 23 Oct 2024 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x80SZbLu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880A15AAC1
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677190; cv=none; b=kdr9u/BnmI2L7Q5JWOjJHKV//aXeKEvVnwu7i9547ABGyLgb6NP+geeTzjRO02UvGziKt9y2igri0y5T3ciW9rGSvbKkFq/8N5Jy5buMSdzsWTgr7bLU6Ny75eWpcP7wqXyo6w+j+x9dyjlHT8q8JwDScTgU/2CNNyNJOTUnWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677190; c=relaxed/simple;
	bh=Sbwdw7QfKSYkbtalP6/ul01s0Qm4MRjTQ/csaN6ZT/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRXYcKn8gjLav6N4kkGYEaLeBaDrKJ3ZBkaHq2sfhgVv2IypyRPo0pG5/Xp39RO/zSpXX6TZIRWULrDIHrHsN2ljsm34dS3x8d93CYLstjOEKR87nuL2ED/WCNNR1y6RtIWi0OkJ01VfPMp1Qa3bCHRbZgc+3DmXDwO/tbqQzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x80SZbLu; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so7178396e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677186; x=1730281986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbwdw7QfKSYkbtalP6/ul01s0Qm4MRjTQ/csaN6ZT/s=;
        b=x80SZbLuUEA625WC5jXGWdvT4vUGTwovj5wgSyRngXh9vU1ed4OzQjkCz3gTFd72fi
         oAlIgvqHyFK9rmWeFegV2K0N0z4dzjCo+xqIbFHJFmDqF21zt5E0/cUbWOeF+O4dKhv5
         x/lNgfZNa+rV4PCJWFVtUa75b0mvOEXMw4LiNNZbswrvLsXD/N0z+u9mMyLjircd2vT3
         JneQAsRXsNluBWXZKXAwNrDCbAiQydB5MZPBUESwQKIJzlzXDBrLQlQ4LydOgPeRKiae
         ENApYyI8Org32WjKOqZpMCo7wlxXbdcjn+Fi6xxr2V/+hKNMWUAiPbGuA5QJr3OtJUwS
         rH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677186; x=1730281986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sbwdw7QfKSYkbtalP6/ul01s0Qm4MRjTQ/csaN6ZT/s=;
        b=L+OcXgR/1A+IldUIRcGzEz4LENtWOIoqIvMJViBClwDETZRr6HQvXVgFyxfELc0ej7
         UGAv6N9KW9Dr++jBYbvGYEikbOgIWL4ud8Tv/JdrYNhLS553e5LV0lypXdjxxBvpWjW9
         NzAzknhLnqyBfLWlxYDTlz9a7tVCTra3BhuRDriJN5RtKF9Zjruykc4MTZt1t1Xsb8r9
         k9MA/ZLUko6ozuHgdxOqE00VKffHwZZo8dBf5GQFgqwLWjVOFu5z075gpIBNOlFNgOSy
         /N9KL7lUGaVkqJaY7mjwU8oFYBPXBHCRX+8gMluIqivXGNKc6lgx6+wU8s1jdEGSmJyf
         OHxQ==
X-Gm-Message-State: AOJu0YwnLCznRYensL3HcqMxamHZ3DnejcBIsGO/8/Nak7f9bJyVW+Od
	UglkFLYv7yEegm5LaNGsBiOrwbHFX74b/pCUrmS8qoxrSgCTMm/zjhYqOZ6GH5Aq5QkRkP9Lh3o
	XrQHrMvjbdlrm1N84sd9ugqaVodZa7MRAKBfYag==
X-Google-Smtp-Source: AGHT+IGZduyXFNO9R8Y5p/tCT3UJ93G3+m8DNutUjBphxaW4ZYITXSGKYXlEk/e7Zp2Lf8bCHSPgekfi0Jy6q1vJeno=
X-Received: by 2002:a05:6512:308d:b0:539:8fcd:524 with SMTP id
 2adb3069b0e04-53b1a346ed4mr949796e87.30.1729677186473; Wed, 23 Oct 2024
 02:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022134017.172411db@endymion.delvare>
In-Reply-To: <20241022134017.172411db@endymion.delvare>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:52:54 +0200
Message-ID: <CACRpkdaS9pXpZ_rfyim01en-mYH5_KhmjY1ASu5MkZ0iM6yTSA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx-scmi: Drop obsolete dependency on COMPILE_TEST
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-gpio@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 1:40=E2=80=AFPM Jean Delvare <jdelvare@suse.de> wro=
te:

> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), OF
> can be enabled on all architectures. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
>
> As ARM_SCMI_PROTOCOL already depends on COMPILE_TEST, we also don't
> need to add COMPILE_TEST as an alternative dependency for it.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Patch applied, thanks Jean!

Yours,
Linus Walleij

