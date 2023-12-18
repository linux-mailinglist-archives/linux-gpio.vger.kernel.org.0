Return-Path: <linux-gpio+bounces-1619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A781817276
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 15:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDD3F2856C5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 14:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414A937889;
	Mon, 18 Dec 2023 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQOr/ghN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C4A5A84F
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bb53e20a43so385817b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 06:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702908415; x=1703513215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wIOhibGJXFofpfSDEGIwPzynecnxLJGufeFrCuiEGA=;
        b=ZQOr/ghNQs+H55FQ63Hr/LxN7Y5r9rKEerXLGgsu7I333f7ruJ2mVzWqaJqsiVPjUi
         5ny/6aaF+v1PSQ2uLMBWFlfWYuDzk15XMGWSq/n854LCnh9OEIywp2hxbz4zDHK5/W79
         zasOC7OjSCmHDiVaj1otAwqTYImPGOuyK5bJK7me+LA8xrG1zoZJT/knM1/XBIQ6TCPy
         gbnT9D0WhJjR5y9oPIITX0iM2PkYIer37bhsU5bzK0FjsoYeCaPUvMqXqa1Wis/FO3rK
         1rLT64ldaKYq+tNcBEBsTSan8gaYxwZ5JXSifizoltDCSp1GcffEAwK960artqN3HJYH
         +v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702908415; x=1703513215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wIOhibGJXFofpfSDEGIwPzynecnxLJGufeFrCuiEGA=;
        b=bg/kKu/YZbFM3c5JIwByj1WQuEhXmW2cw7ApMig0PW2u/IbXmJmMeXM2kAzQNZOBiO
         fZ0UJ/5rwNmn+Ygc6hEYD5uNGXKpTkQSWX1dPCRU9CeO+/JI5cACmGBtZzEpNqF9IS6i
         NiszfQomwxvxsogDoddFtEx+VJOQ/wMIrFxgBGwuZswOMyfCmyP4NVnlHx2oQsamzuzf
         6gjpj7osjIcOIUH0u1vam20ox4ZpXpjoOWm7mHgBDVxShtKHzvbBpVbU7J+pm2O64SCq
         Te2+X0McliodrTkWpSl/v92TAJrDRKu/KWFYSu5ITSJDu9A3bfCrFS4KcgrL6p3wPyRK
         rD+Q==
X-Gm-Message-State: AOJu0Yz83MpXnS8+2OABIGMgyVeyf4urFl838ilBJ+fOzEH3UedIkTlL
	BIf+9PaD54qVc2rypLJTb9oxsxQHxqQmJEcWdoq77A==
X-Google-Smtp-Source: AGHT+IGW9lwauNcpVu3C788nmkRoMvRhPi/6Vtdkith2DcDMCYrdIGJRCyTh2167K6c/ggb0E03sWA/dWtsLOc3323Y=
X-Received: by 2002:a05:6808:1307:b0:3b8:3442:8d99 with SMTP id
 y7-20020a056808130700b003b834428d99mr21287470oiv.20.1702908415587; Mon, 18
 Dec 2023 06:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1702642700.git.geert+renesas@glider.be>
In-Reply-To: <cover.1702642700.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Dec 2023 15:06:44 +0100
Message-ID: <CACRpkdbtWtLEFr_AvgHZ6yfL17+0zXY_Czwc2zJdaSTU1dbWHQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.8 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 3:20=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:


> The following changes since commit dc99d4c8ac46bf533b9519a53795c4cd6ff0fa=
39:
>
>   dt-bindings: pinctrl: renesas: Drop unneeded quotes (2023-11-27 11:12:1=
2 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.8-tag2
>
> for you to fetch changes up to 9e5889c68d992b65efd10aa0a4523c96fd07077f:
>
>   pinctrl: renesas: rzg2l: Add input enable to the Ethernet pins (2023-12=
-15 11:34:34 +0100)

Pulled in!

Thanks!

Yours,
Linus Walleij

