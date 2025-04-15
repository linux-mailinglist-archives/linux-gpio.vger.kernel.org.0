Return-Path: <linux-gpio+bounces-18810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAE2A8956A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28941899228
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3931427A90E;
	Tue, 15 Apr 2025 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DUn9wPad"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E54927A135
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702977; cv=none; b=dTLTf7aZE+G07Gq8g2vQN9Nlj9GCmG8IJXUG6DZ0iJ4vKWt3tnqPR9s8T2Y2iU00QAdJ+yfauk3xM0S64j+aXcvMZBAChs1vPbiDaxYmdsoRL7u/9freOlwohUxO/GeCmxhFe/iLbCK6Ykbuk8twYn6vPGmR1bwjKhBE/I0qv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702977; c=relaxed/simple;
	bh=FrsM9iiedOM/M5mnaIv6iS/9Qia3AnBQr85/ywInp/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eK/PSgFfy/LD9mlfh2MVwxwyZ1MfHVDjoPgIMJzYSLy7S9mzDs6Sn3YtundSf2docQHQE/gNa0M8WfExgJvjmmHmuzP/CauYHqQm4dAX3Wm4j33XBg2H5CZbbGHy5ak6PKn4LYgrxMrYB4iNmcqVv/Sm6dtb+J0YceelZeN+aVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DUn9wPad; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db3f3c907so52435951fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702973; x=1745307773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrsM9iiedOM/M5mnaIv6iS/9Qia3AnBQr85/ywInp/4=;
        b=DUn9wPadXoI7Q0qPOLLfu/BdlxuOBh9xe9cPK4kwJQNzPnCzIGRynOzwbMqI09/kmC
         llvvjos9mTq/bErO1UT+5SKgQXBF7qQlR4ujusRT/G352YitRmfghbRsBpbw8RVWRBYu
         HsfRHyXm7Y34bQsRFc++7vCcT79VS9PWInOFxs3dKrI0HdeEzpK0jjPZKHZFJZdZhpnh
         Av5NghnjEcfdIM8OSRbjEOnBKHqquDTWHRYJRcslUPAAkXE3opeL0L7PXfNr/07eITZG
         YQsdHPJwnJgFWfZ8P811dIekeTDt0T+8K1f0FgcZ5a4kj32DqJ2utPudJ8KDNAdhwYKx
         DIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702973; x=1745307773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrsM9iiedOM/M5mnaIv6iS/9Qia3AnBQr85/ywInp/4=;
        b=HDVnFQwS67UdEpR4rnMbsMCi4iErXX6WxkPztbqwIVjoLOv6PGlik3zOxsUKo0h7uO
         HeiCxjrj3zvhA31tVdU8IECD268MQYXmKHuxDOLHVjbz3TlsaiS/yu7NpwYAAN3CrWSS
         vksUi2SepTghQPvZY0Jv2MCA5lS6zKkz56RxzmZeoN+8UMHvXqhJsOqgx2ju9HIbLXi9
         QQmlB4r0haLVSvI52wZUEBE7EgLqP+BRy+jqL7MEfs09NlhCWZP+FXb6tPLaxjzcbb39
         46n+Jxx0EK87AzJCkYadIkhrNizveTxwKiQQDB07Gtpbfio76tITcMsRrlpPRwzZLOof
         Y71A==
X-Gm-Message-State: AOJu0YyGG+tr6pzBMSWaGC5p/zt0/6Jgbo7hLevL3BfOsY7zQrZgulQr
	8jlogTu0n4+9oMcBBbTuRLc3q6fuwmsk1A8OWVyYspZqF/K/4TuhjOXiYyiOCp78KIPDOZEzcJt
	pg+O12gf6SijCr2cefpej9/1qVJgUV7iLiNE0UA==
X-Gm-Gg: ASbGnctTwIabOoA7mag/Zb9nhPSh3vqWKLOZCbPRq3f9SdPWCbKUopaPvCjVPB6FyKA
	rBI14h2rxzE9pIdHxfjjzi7mMjfefnT35zBv9PRycuXOpKO4lEkVzOLWMdyGYuJ025pKbZzFfkA
	NR7+8Uzg3poKU9HhMZp/oQIQ==
X-Google-Smtp-Source: AGHT+IHgalo+jgjuU4utc2ZA9vkCjPT6mKMoSs9gFwa/t2RC/E/zR4Ajm6IRPAJoOEy7VIxNy+yoZ6pnwQHeZXy+WQ0=
X-Received: by 2002:a05:651c:1464:b0:30b:e3d9:37e5 with SMTP id
 38308e7fff4ca-310499f5f26mr42974901fa.13.1744702973134; Tue, 15 Apr 2025
 00:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327031600.99723-1-hui.wang@canonical.com>
In-Reply-To: <20250327031600.99723-1-hui.wang@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:42:41 +0200
X-Gm-Features: ATxdqUFq6sWueB9SaIFT69Cg8--gm5UGb4eJdUIGm1zGwfAodpETvC1tP1jdc-8
Message-ID: <CACRpkdYSSN6OFAfCoPeW50a3hiDJWv3huBaEopuprgJa+kVZ7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Return NULL if no group is matched and found
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	gary.bisson@boundarydevices.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 4:17=E2=80=AFAM Hui Wang <hui.wang@canonical.com> w=
rote:

> Currently if no group is matched and found, this function will return
> the last grp to the caller, this is not expected, it is supposed to
> return NULL in this case.
>
> Fixes: e566fc11ea76 ("pinctrl: imx: use generic pinctrl helpers for manag=
ing groups")
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Patch applied for fixes.

Yours,
Linus Walleij

