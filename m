Return-Path: <linux-gpio+bounces-16972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0EA4CC44
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B15897A85F8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 19:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54088234989;
	Mon,  3 Mar 2025 19:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Een/v3HG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5807C2343AE
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031602; cv=none; b=GB8NdaCXjRLWTncBG/jBGc221uFAOIZV94LX4MvO6F0/3YpCy6saYdi+Np46+/b4QBFQAXwstozdqwcfZK7khkTZgwT6nPTzc6N15fEin07IJOaAucgv5adVW+CT7YBLRlgMge/yTvdPyNpj7GXZO8QzWfyk1wySUqC09F1+evM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031602; c=relaxed/simple;
	bh=QFTGZif/JgVgVDzzGQgZIl8WC/WC0ykZHCXDdOp8REw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxMB3GDflFJOliu/MHCH1HnnQ5Un2v5v5WvunR3NoJ5IoxxM/eHSdfMtAbEiSUEYXgkHp/MGLxSWFDUnhNTMh5NWMroIGZ4gEm79ZjmJ6QdhTfmwmy8yzoZqkXTxcq3PpXe+jo8EkGGz0qYjknfYb2HjXuCnr8HZWQdJw3D7RyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Een/v3HG; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so51533791fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 11:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741031598; x=1741636398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFTGZif/JgVgVDzzGQgZIl8WC/WC0ykZHCXDdOp8REw=;
        b=Een/v3HGrIUsxKLvpK/7nPtnYTaacphMIjptWX0/VuJMJD3H070xA1XR6kTs0Mo0Qd
         +NOCoa/Jo/5AUSoG0ChZRnnea9heys6gnguP8YjQSxml+Ytto9mkOmHzgxt8tqb8DhG/
         7PdcgP5XH/C3n1+2dUCQXK/6Qtt3VvGfVnEwPsornhgflN7+XsagEBSyDbK9GSVqwKBd
         ND2VFZW12cCMLJJEbLtbjYb6VZQwXVL+riMPhLNhS5Vw6moP6tA4UagIaUTgb8S/G21z
         c4Q1bGIuFkKzstiXIIcrMMPupvCJy7BXLh8FWHajQnfvUTIxSTQBZ+2YUzsB0kyfS0wt
         GH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741031598; x=1741636398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFTGZif/JgVgVDzzGQgZIl8WC/WC0ykZHCXDdOp8REw=;
        b=rwPIy5gUSL0qFzRLRh4H4VubJfbPqeJBIBdyKRsk5UJNV1yg/qItElX5J+zLTSmufq
         +NPkbgMxLE8fb4fO3tvIPUPwuqtlcesJzlgLIDnxovAR+vDLGdwqb7tqh+G5QFExCOG5
         x7Gzpe5y7HJJP0pMynA+gC00PyF8aCgRZLJAlCBXVhnaReVEHH4hnObNMXaCKrjmX/KP
         +eCqcStyct8RWD+ulEbSbkeeBqn9WsD/PXfEDNOlUhg7msDkQDUhjlgBU0HLv3Hx4gWw
         u7HNJOtIu8Cjx3/njBA8My55iR7cD9KedQVB5txW8VOYzm6eiAxiMEhFUM+B243VM5eA
         azIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO/sQE/s+iWIYpPGFruGLyOeX17KfgMSIEwd/59uBwKb4qZvhMenW7xoYig1OQORGB4r4tVYMm4ZeH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Pd3guCSAHHWIPsNxlDLudu1D8NLw5xETovpCXrWjZPG7jpbt
	e0yTQLN1+fUsgW59qqn7qPW3ZPMBJ9CcPfZFwXLgYfSvpG7c42dM94gn/7WrXl2UiQUlmFc0AkH
	h/N5270tQ11xrbUMFr8/CzDSW0i2gZ9ifwOoi+g==
X-Gm-Gg: ASbGncs4IcxQfsinE/N4WU43mzR3OZrY/TXTAirRrnZx1aIw+9Ell8azMgszty2LSJS
	90qoRX7j9Cnn0VeOe/rT+niBMyWUZcgIokAzIP34QGdVW7RBDYVIic5Ct9PN5E45rV9MSbVJHk8
	1ic7Kve8aqhQoVY9g5INw+ISKwvw==
X-Google-Smtp-Source: AGHT+IGAA1jTPTvt6x1HBPDHZpPdg7RIJLS5NDUt79SNfZEN5S213uxZfLpsDGTLhFe/KqTn7rcm59WJNzLGOylvX74=
X-Received: by 2002:a05:651c:1a0a:b0:30b:badf:75f0 with SMTP id
 38308e7fff4ca-30bbadf7dc2mr20317411fa.2.1741031598367; Mon, 03 Mar 2025
 11:53:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com> <20250303164928.1466246-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250303164928.1466246-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Mar 2025 20:53:07 +0100
X-Gm-Features: AQ5f1JrLhAM1wiHutYCTK7Ia19KZ1ZhoXNrkXyL4siFeXMeh8rxos64YMy1PhkM
Message-ID: <CACRpkdbeTG_55VbH3GBVpB31D9uuLHTZpuzjA3PuxwTB+KEq8Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] ieee802154: ca8210: Get platform data via dev_get_platdata()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 5:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Access to platform data via dev_get_platdata() getter to make code cleane=
r.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

