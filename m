Return-Path: <linux-gpio+bounces-5592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CCD8A7EB1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 10:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741CB1F22676
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 08:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F1F12BF30;
	Wed, 17 Apr 2024 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvnPxczV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD0F129E8F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343933; cv=none; b=tceYaUqbk5pOj1ke5sF+No9y/yekZdzmyHR8wI1LUP8t8kzlbGvynl8+EVpwt4YY2HiZpcSM7i47zDhgLPm8rRgapdNIv1Qona2UZZ4SxzAvQ9RITNfl/nlNVzcAXvMi/eQf89iBi+KY7FXPUdcKxzHwTIzss/pJ/BcR9tDa+9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343933; c=relaxed/simple;
	bh=JMmXhv3YrwRo9CQJAJUZqT+fsVATl/0IC2nfdrMLgsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1mG4/enzWnh1d6fuEoEiq7nPei2ASr7j/+W+LeQUq/uy7kJDFRJSutFV3ECSPMmFHq1tO6HSsZpNsyqTK5rTHSPJ0F/fJo08w7jZAgVcxYiJPQNkwhQkcgHisEv60dsoeFS/MYA3ZMbjT2NCC5kEPvMxCzuz4xkeuoC9sZtHoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lvnPxczV; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc236729a2bso5118510276.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 01:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713343931; x=1713948731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRn14IhApnKNDMlAbxEyi7xMVt+mEK/2ttermI9zL3I=;
        b=lvnPxczVao+CzCTYv4I0R8SPvvG3tsbtgtgyimNSIaqXYRX8YFDmd+LWoqxvfZUQ9X
         ZtR6Ezeh01BBOiRZDgT2yldcgY+27WjxK/eTxj24shCi6Ok0D3Y5h8o6WjTtgjl9yurv
         DN4974LIVZ2JiIUdY+9/J78a+5kU4wIgzkC991JPwL2TQ52ZKIhDsn1ojyxfWQENySAK
         QWzgID3kZkk61FZTjkTlElS30XFhtW1vqO6RAtelBjpA9GNxkMh6L67uftbU+uQpbfnB
         X8lQURlusErPYJ+V3329VrrG5CXri7SBScYexVkMLTxhHfx7ZAnEAoj2kdpikjOUMLTv
         n3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713343931; x=1713948731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRn14IhApnKNDMlAbxEyi7xMVt+mEK/2ttermI9zL3I=;
        b=hgPmwJd7MSgKcw3Goeq0r4ubX8t/FzdA5KZHKp2vlGpEzCV/bHcNJ1qz/G8ITm/kQD
         AU0DbFQ0HHdLeic385uKChbrWLiEl5x+SBiZfWFq4yy/8y9sexhROCSriNeUcZl9i/1v
         AMEM9ZuW0xIIg/+786JSfOx56Oxlu69vHmlrD+9U5qoIoqV3UNCZ+GdAvg45No/EXcQ3
         VVB2ftchiktw3VrHpjNjm05ommXlSYT/rRWPb9k892i9G6QASd/1WiIlHSJ+AtPNgyI6
         75OgXW6CbcczAngyuwtorvSFTyxlgqzSS8P8hBIAmQwijyI55fuL29jHlo/HtodXZ/bR
         s3XA==
X-Gm-Message-State: AOJu0YzMfiAnEcy11mCYc3H03o/2D8zVKvbwxMspMdYIx2H6CFFV61ub
	2DS7Slr9+Y5Ja0DdQgufN7HA2sbBjjLOfhd4saglnBagvizV4hoWf6aMYGSC8aI5amXGkQD+qnj
	73wl9iS8aMTfYbHexXA7oYFyMKLSOR2UPx720Fw==
X-Google-Smtp-Source: AGHT+IEf6aAIcdoxddXDkHr829IAaeT7lDLdT4mK4keoFmK4FS9SzSqnT6aIUN8X5nS5SIgO08v+auKBl9foxX/lHs0=
X-Received: by 2002:a5b:686:0:b0:dcd:1436:a4ce with SMTP id
 j6-20020a5b0686000000b00dcd1436a4cemr14063380ybq.23.1713343930717; Wed, 17
 Apr 2024 01:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1712915891.git.geert+renesas@glider.be>
In-Reply-To: <cover.1712915891.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:52:00 +0200
Message-ID: <CACRpkdZ8zgkiJCkGpaOqdB9Y27EaaoUm+GznmEEt+XWBbTO4hg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.9
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 12:48=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.9-tag1
>
> for you to fetch changes up to aa43c15a790cf083a6e6a7c531cffd27a5e1fd4f:
>
>   pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration=
 (2024-03-26 09:42:37 +0100)

Pulled into my fixes branch, thanks!

Yours,
Linus Walleij

