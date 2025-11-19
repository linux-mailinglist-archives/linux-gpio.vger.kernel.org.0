Return-Path: <linux-gpio+bounces-28763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C7C6F41B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 509294FB829
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2DA33C1A1;
	Wed, 19 Nov 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJeCrpJC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E535A13F
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561106; cv=none; b=GQCRNp3LUJSS0kja0MlhyWycicK84AdTrUZ8yOCliYKWDY4u/srYgPeLJqx7Db1wcUkZ1wPUg8REgofHEpExkKJCGWVs678vJdL2aJfUKguPxuKZAIq+OnnXvhBVkc5aYMfo3RiWrK85ERl2kbKeg14SDY52Fm8tD4w6PuOwQcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561106; c=relaxed/simple;
	bh=3XcwcvQKith1HSfQBVbDAwm7bgtgIgGfl33KHHC6swQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIdbX0ByARXRBdztvm6A+kV8XzFOV2P5G05Bo5Oxg8ulBSjneul/voLwbJ1pGwCAZXMM2Usj461YRng3H5Z99q8FoWuxiXoYDDDsKzwKTWQBbpBMhEF7HklZ77be3NQAhuibmXIG3fzT0nsiQpaTD5kvHB8n0CUe0jV7vZ10aKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJeCrpJC; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63f9beb2730so5423922d50.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763561103; x=1764165903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XcwcvQKith1HSfQBVbDAwm7bgtgIgGfl33KHHC6swQ=;
        b=lJeCrpJCGWb2rkHYrq0xMkQ7vQajJA81igXr80+dqX7XP8DA25RiOMnPHinwH+sKZt
         dZ+VeV/mfeITdo7D9AlAh1w3r3LEAg/hpuSfFnT2EJTMRDHYDyD+HOnZtjpf7Kbi0FLX
         f83F22bRfxAwhwI9xn82RP/YlFhV+y1Y19SnzuLX02Agkj/yfkl2o4lMNyNxasrkjBpR
         Rl4J3t+gXyNhCBZw9SJ2L1/CGDJoC8IQYKrqHrPfcp6KOj1HjNGqIhmSLU+IKEgnP9Gw
         fSFC8UPJ/yJoG209oIEVzsny75nyBHk4GCz6YZswv5fah0l6SEWgDX8rmlZv+PKjqgwb
         qdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561103; x=1764165903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XcwcvQKith1HSfQBVbDAwm7bgtgIgGfl33KHHC6swQ=;
        b=wJ7qF9ok9DFgtWG7rUIZ/8fUKxnGtdG9lJFZlrfa+Bj0K3a71KKt7rwSaV2MYMuY0d
         ekby1/fu2e9DffO7Z5t/lzYvLhI6iQ9dLxL1rX5Z9lNiZ90oaKCjJzg/x8ALM4ARmgxG
         YVr8rMSiYtgmA190QaUKyQrlo6ZuSXtkaJ/q/EvhkX0teWvvUalQSmEqfIi7xqTsd/ZS
         +Xh0bkN3uokX8B1e5lG6TnGF3l/0x8L2vXYOH8NaeKfnEL+rdfkenPr+KueFJQGNt777
         bkeCOOnYpEILpATUe5n0KM0OBqy9htopsRWApvdwbxCfust3SnUEyyVCb8uXFOhAr8wm
         1jfA==
X-Forwarded-Encrypted: i=1; AJvYcCWIvam4UTPfGaTNfr4WlPzoezXKLuI4V59Nbs+V6PJ+2B+E3Lsuc8RKCRCmT2zLEsxa5nBSqW/uCsgW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jYCAw8Y/QRVH/MWiNSCKSm3xqFLDbB0UM4z1bWOPx6GJ1Rgh
	jWvFmWMVGOJwMLhZQfBOpPSys8pa801FUXnC/B5k/3BJTMdXUzxzIz/qS8EQLMAd7wQenUe51Zp
	Kj+K4H2tZn/K8GtGRNAg30NYcFJvALujaZFvFQtmLBw==
X-Gm-Gg: ASbGnct+Lj6/J4atkpuUW46xovzJI2vG1Ns6aaSf+gLy4asGp59i7Cr1vJsoDQyRP/B
	NQ1MNwL+V1mHTiDgF7i92Up8AesKKtVlmChkzDLZPsRbbmuvvzlu9nEn/XuQkbCejiOAuI1mcGN
	ssVhi+y/xyOwReIgA7XqJCq6YqGUID6LMDyrH8F8tqpCfGpLrTboqjcDYBP+qxdxdhIEt/V7eeU
	b4uE+Menzraivd3CXk7LqHEF+ySZGY/aKRzRbHVFgR8rAfWBU9EO0KHzfFqwh3QoHXhwTk=
X-Google-Smtp-Source: AGHT+IFviw+oWcWVaSZFyn5ehDMWabNcVHWHB8z6glzqdHBDs+IaoXrN1WdVMkULzzlFbfn37RIKteGn8KHSPB4Qxa0=
X-Received: by 2002:a53:acc9:0:20b0:63c:f5a7:3da with SMTP id
 956f58d0204a3-641e76546f7mr14591371d50.54.1763561103023; Wed, 19 Nov 2025
 06:05:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118083115.9545-1-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251118083115.9545-1-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:04:47 +0100
X-Gm-Features: AWmQ_bljM4jSwtDyY4I9cIYY63GAG6GowiKjZq9SqRxyeWj2xIDREJ6sDGRPIUs
Message-ID: <CACRpkdYFy3j3auvr2Hc+N-5CaJp=TF-3YAe9-cakswNfNzuxnQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: menz127: add support for 16Z034 and 16Z037 GPIO controllers
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 9:31=E2=80=AFAM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> The 16Z034 and 16Z037 are 8 bits GPIO controllers that share the
> same registers and features of the 16Z127 GPIO controller.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

