Return-Path: <linux-gpio+bounces-10815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D718D98FE00
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75515B214A5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE0D136338;
	Fri,  4 Oct 2024 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRPmirEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534141BDC8
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027908; cv=none; b=HM+mr8+4crgcRFZWwjYEdMoR7ZOkbBMjw5rqIM1WzhcDtO+Rks62bZTajlyS2M9UVWoWa3bzF412LE29AcAbvHHgbkJw38pfzFYJJmu2vyQGjzK0r2QbRhMZCWXcK4K+yNXfJj5jYowl2sei/ZHDOS0EICXY8To1y7oVBmynrXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027908; c=relaxed/simple;
	bh=MfbTlDMuL+WsRgs+I3YOldQ4c3Kj/sI/ZzyAKzI8PJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWUWU+VJKgZeIDgj3Kj7xFUZyO73W90cLzwV+3CW4dHfahi85cg5Ua1Dwa+55h2ThkeJ9lgZTt1HDOUPtpXQ8KjcNbyDq4qazY5LVQRdKMPYtjwSsNV2bTUrAZ9z/uq40zt9ipCYJsMukKhy6gJg3SZPsxiGi5WR7naPe7Kl3R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRPmirEG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2facf481587so17564281fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728027904; x=1728632704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfbTlDMuL+WsRgs+I3YOldQ4c3Kj/sI/ZzyAKzI8PJM=;
        b=mRPmirEG9WQVVTMGlxpyyiJ71E1o3czSLN8cjFbc/CEKMwcwYvNvrBEznl1aArrlJT
         zUNOfw5BwUbp2rWrNn3D85pXPTYTZZUiGnZgfiZgCOnUXZfnY09EXyJxwP1GkkB/PuJm
         rQEBdfhQWI6mVJOV5MA15NOy1R4VeL9UTwwsWXz27V2pdyVlXHZXYJOZpaMGPWR3WH0T
         lxd2R5kxP+9oEWM8KjxwU+O4gRXTs16NVB0Bqb9ODds0diY7YxDGp2PnuE20j9sJS+/P
         0NNfA3td/jJKl+3hgVde/knw4zcc29o34N6d+l7iBgbVv2H/VCkJPD0FQFZURphoL7x5
         xkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728027904; x=1728632704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfbTlDMuL+WsRgs+I3YOldQ4c3Kj/sI/ZzyAKzI8PJM=;
        b=olpLOovEmaHnf6Nvgaiichlb7du6E7MPRSuyKEVG9GcFYqPOv+yTEdhCB4tIyQyFPj
         JJXoiYmWecvmyX9Vk9VEkpBPpdJCNuuU0VYvDEcnF7ebCreemoKY4ImJ36l9Zdb30HhH
         xH2Eiz46p3JCW4fGRIQeHL8MSqd86IVvfSbIPJKEdcq/dXevu2Ex4AWfGt8hVcEqlEE0
         RkspgRW2NFzwSru+PRnXvl9cpnd5v0meE5dfhLBofwGng4TegyYyddzNRHSShfgyqG3A
         pQM0L1kX0OZAY0S+j/+Lv5Y9jg23Uwa1AODFO6rg7zztAZ0HA7+LjrpXJKf1mRQnEcDV
         F2rg==
X-Gm-Message-State: AOJu0YxoCsZenQBbQGRt2bRuDMLhxSxaas/WbDTqG7a2IJXCPrg6oIxM
	8Ef/FHsAHHyGGGdLmgAxPFqzy/xt6VvPxjPNoQsbiPCoFAmmHhltrHvkQewQpec57mO/4XD2NxP
	fvoOItJQIGI9yGeqozz7C57nzhOzrol0QiaHPIGOdtASFn/y1
X-Google-Smtp-Source: AGHT+IE6irVReFP2ncLXpVBWf5d0/G2Dfqxfwx/uKcOnBdIxnheNH8zcv5Ovuh8vOE6l6RHXoOQLjKbet3msXUEIajQ=
X-Received: by 2002:a05:651c:2105:b0:2fa:c59d:1ae2 with SMTP id
 38308e7fff4ca-2faf3c15473mr9424951fa.12.1728027904312; Fri, 04 Oct 2024
 00:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003214746.146207-1-rosenp@gmail.com>
In-Reply-To: <20241003214746.146207-1-rosenp@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2024 09:44:52 +0200
Message-ID: <CACRpkdZ3dG46YxC9_3RmEpH-D0jgn5d35=TwEotsa8KU=qpxng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: use devm_mutex_init
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 11:47=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Simplifies probe by removing all gotos and removing mutex_destroy from
> _remove.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Patch applied!

As it depended on the patch already in fixes I first cherry-picked
that patch, I suppose this is one of these few occasions where
we can allow ourselves to apply the same patch in fixes
and -next, as it is so small.

Git will figure it out textually anyway.

Yours,
Linus Walleij

