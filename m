Return-Path: <linux-gpio+bounces-13262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B579D7D6E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 09:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF06282060
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 08:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351F318C03D;
	Mon, 25 Nov 2024 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uN9xHY4X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA1D18B499
	for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2024 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524554; cv=none; b=JAI6IqSGSThw/QNuLw1t/prP5FdHRZtPLKA0rXLOWS9JddFoYMx/Qv1DWi+b9hOaQlzUCcLzFta4/DT4ls61UyQezuO/JCQsKxhUmzPkgUoM1KT2KJ134192RKQ+22Kxkf4sDMzPC8wbnUES05N5P4LvCyBg5LJaJCqFubE64SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524554; c=relaxed/simple;
	bh=4RLgH8DotN31qT1086DXFyu/dfqEgTSa+OguTyYp7nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Enhzlydwz5WqSOftMoJUGg2GoXQ+CfCLxbE6zKiwLkAlYpBxpC5RVDHsS/O+T8lVy8ptW9FD9nTmPs7qqOTGrEc0Suv2fSBm1V0lJ6LaIlJHCldZ8d9/+Uc5XzfQ6MJeVww5zESIwXZyc6T7dxxgE2J82+WGhUsIXcz+V0nvAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uN9xHY4X; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53de556ecdaso451092e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2024 00:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732524550; x=1733129350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1rTcVpCTeLQN8k+ZxIX2C9rl0ao46Uuxk14w/Clbl4=;
        b=uN9xHY4XDaJK76C0oaPzqSxcIBGCK0LRvWlR/9CTkqXOUFULuR/ob61uS38WkJRfYE
         pG6o9A4xE575WihsnVO10QfDxE430ZxRQiB7gjDm7IYBjxKYe6wE1P4RSPBna56Jpuvc
         5tBF7GnESgzbHIlybIJ7NM/zlPT8tMyv9Y4f4eDgPrexDjzhbMJGeAYyrKF7aGej5v0r
         h1KtEhFF8DeS9yuCzYWS+SPMBhEaHxrIcTSucjHjhQtESW+jw7ypMNp/JLrxTTE5p+bD
         STXj4QY7qA4fp3bSKG9WsenE7Y3irTHqGjx9poQ8nglrNPOk6Yd24+WNvnl4Eu3ZzgWH
         gWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732524550; x=1733129350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1rTcVpCTeLQN8k+ZxIX2C9rl0ao46Uuxk14w/Clbl4=;
        b=hGtnbuR1jpuViCATqMp8VvcnDLRpApdvVYn4iZ6IqnqRZXnvTDmoQCSab976skcG4K
         c9WyDU7PKwJh0m/R7UHkFv94OWB4ADI7v1z1HOy+nVNEV3PxGQWQrLBFz+ds14uOwj/O
         SA2AChnGDUiQeeH9vNH+UH7/GeJL6ICUOoHn/GjZeDZlZBNrfbPmsPHDrzTApu6aBMa6
         kA6vEwRKY2+6rAX+HJAUG3+vw3+rWvemwx4ZbM84CGXCBgDH4g/AnsWaUyVoV6enWiAf
         VY6D01jw9V3Jxv4zC8gnnVbZTOvqyM/pIL4tPGIy4N8p0cbuqpaVGmThQjdNWa1f5E8w
         msgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEaaRLGJV4ZbHPsJCNBciRzrF4iURAkXkqUIvFf8kY+SklDWvMipGZQ8VkTCMKGQ3eQ59ECGZ5vPKI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3q3eXMp0PrgQLzJ9Nx10HnnOaTIgNtRnRcsZtk0TVXjeGONb
	DJgeJNtWPRIEu626L63/TQ99ORX9YTxR+WnCCiHszYivIpV0xm61YBX7zHAiTDkO9aQVq0WEA31
	q+mde33qQJChzTz2BK/jfxXFZuEmXHaQnVEkcJg==
X-Gm-Gg: ASbGncshmmANWQuK1Cg2qltL5UzUF1QZqp8KqLH36FNpV+e11IQbhuxQZFXXkh+7HmD
	BsRPmN3Chwm+U0jSE+9KV3g79T4XAMUo=
X-Google-Smtp-Source: AGHT+IH0qO8VgtI4FMGXsSFrTONtuxq++JyNmNCc2iSKwpaIiDBK6LvgvP+XFRoiMgkpMn299iGAQD9EbtbxgwqveI0=
X-Received: by 2002:a05:6512:3b25:b0:53d:e397:2dd2 with SMTP id
 2adb3069b0e04-53de39730d7mr1168732e87.2.1732524550278; Mon, 25 Nov 2024
 00:49:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>
 <Z0NaYhtZy89ObgmR@sashalap>
In-Reply-To: <Z0NaYhtZy89ObgmR@sashalap>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Nov 2024 09:48:59 +0100
Message-ID: <CACRpkdaZ=YvMSLYWUrmsjknk-gNV8o5v_y8sasRcxweyTSkKHQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin control changes for v6.13
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 24, 2024 at 5:55=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:

> I've just hit the issue you've described in this PR:
(...)
> Is effectively a revert of one of the commits that are part of this PR:
>
> >      pinctrl: aw9523: add missing mutex_destroy
>
> Would it make more sense to just re-do this PR without the offending
> commit? I understand that this is a fairly small fixup, but I'm
> concerned that this will just create confusion later on...

I don't follow what you mean I should do. The offending commit is a
fix and it is already upstream since -rc4.

Torvalds could probably fix the issue by simply reverting
393c554093c0c4cbc8e2f178d36df169016384da
instead of applying the fixup though, it has the same textual and
semantic effect. I just tested it and it works fine.

^Torvalds: looks like revert on top is a better idea than fixups
so we don't upset the stable maintainer scripts.

Yours,
Linus Walleij

