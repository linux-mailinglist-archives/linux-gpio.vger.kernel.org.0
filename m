Return-Path: <linux-gpio+bounces-14970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262FA17CE4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 12:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D186A1605E5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FFA1F12E9;
	Tue, 21 Jan 2025 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quzr7SW4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D101BBBEA
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458450; cv=none; b=l5rSmWzzRlJ/REulQpk6ARt4lk5DcEg0Y6jjBFMcksTpVeXFBPXIq13p7QP4QMTW6D6Z60iHLnwfCsiMrTrW9UdmJnPutv2EgWjMxibnhS5ewrC7DvzrCYqSrq0qPjlqXZnRUzzSNqDwYxdADOVTvojnhr9FjZ2vrvftFkBQubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458450; c=relaxed/simple;
	bh=qjTQpidvcCkYdy/tnoHQ2fn95+J5qhGDadqKW7PFyV0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b4TpMdxJ74H2C6y053Mns1g+SK8HUy7Fhu+Ox1AOhI4UIKycJBtUTp4N6iNwjBdssNlbVSWVj5vrOchfnhyDzGmpCwnJUfbKG3C5ZY1jR/FFIe1bPpeKYW/Po8mUDE8DiOcAGD+Gn6GCiP6/9z/3okbZsDB6o3XypeMdoPeg5FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quzr7SW4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436249df846so37307685e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 03:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737458447; x=1738063247; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y7zIFb2biPGgp9ksv7Po3u3QL1cwm6u7lkcvFCycA2I=;
        b=quzr7SW4Q7iD5Rxt0rLBJ7BIx4yJyPty9IqT7YWkE3SGFOTJbN/DPMLfCEIxw57tsu
         4PdRzrhCT8Jlm8K/r4JocylE55Fkp803Skrs40RotbnPxpikKqD9PK2HJjHSDU9AtyZB
         eZfZlbo0FShh0z6oEONeGqvY+Rb4ycIHzQrnngQbeIi2zULQJWNtRZuXLyR1d7ENkwQY
         P042tAtMms6GKObHf3Gn04NYq6hYuVPVTZIFMCrQlles2w2htUWwEv7oL5Y3M41apAs5
         W39k5HsrKmd7Ap/zR4c5YpKQ6eqvsTT1Z/G07OJKB6lYv23U2CXuxxz5vcMw2N87xwjs
         oqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458447; x=1738063247;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7zIFb2biPGgp9ksv7Po3u3QL1cwm6u7lkcvFCycA2I=;
        b=skaPQ9BwuBlj5Xe+MMGC3kuxmUL9f0IHA2e0vAySNnpmDTdh1Th/Rz+EyTk4f1uMHQ
         tzMgT8FI7gkwPXnBZ3huBPx/tchJLJ8zDb4sR4TRtTsKpXbPqbBGpYJAUcVepGav/tAS
         568BWx4/tzxwKcR/IEtT2zlWzMShfdb0KzHgd/WXpei69PIG6JCQGMcpkmWSMxEqMvuS
         M3by+uxhLfA8W5tbPQqFfHNqATN2KFciYZUT+xoKGBF7LHsO8Ms6NFY7vQcev/s+nJ3C
         1OfJv+T9U9ehAqzefJxJzL6GYefDZK1Z8r4QZMjaf0Dafu9IVdGfi3lSEGb9eUQZH/VQ
         WGrA==
X-Forwarded-Encrypted: i=1; AJvYcCWTOxTmxiQp7oB66sLBUwSdA0oCL5jnj0KVSWndBJsie1ZBN+F1F/DjLj9Gey6biggZ0XY1KN+IR3W5@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXUqhYh0oNZaV2+92aIeY1xVMovA7kERRjVRpySYoDbBzwmwg
	sc93HjUSvqXYIBUI5y8Z9h/7Yo5qT6x7XNwWC13jlrB6od9bp1RYvRX1XobVqTw=
X-Gm-Gg: ASbGncts50U5HTCB2Sy8KKE2tZzPHrOQ8KhfE0gKkDcS9vtnRQXZ4cv2smQrU3v8YZT
	PocW1mVDlFToSMdAOOrUzgl5O+HhN+HgR6RTZcAgAOo/8mjSlQ5aYFlUyKqUVinUo6hGrHNj4X/
	WLUNsK5uuOXnzB3PEtRSUjAhRaJ6gYXYsztH1dOq+c1F55uHVhiiel1UFtzIYrUGfbD6AS3ubKE
	70QQsxk52CQ6xoZIU9gZLGSOv+pOU2KzJQAHUhnnGVV55hMc2+Yg23Wf0wZhgOTQMDrfYvuNA==
X-Google-Smtp-Source: AGHT+IE0y+tu0fWyAhJdzk7OF8kSuvMPYyFJRvvseEP3YUChEAoRqL2VBPrLKjVbpVCv/r4cnPgqGw==
X-Received: by 2002:a05:600c:1547:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-438913c7fbcmr154303575e9.4.1737458447389;
        Tue, 21 Jan 2025 03:20:47 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499942sm234080805e9.6.2025.01.21.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:20:47 -0800 (PST)
Message-ID: <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Tue, 21 Jan 2025 11:20:45 +0000
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
	 <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Peter,

On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().

Maybe split this patch in two:
* first to do the refactoring plus adding exynosautov920_pinctrl_suspend()
  and exynosautov920_pinctrl_resume()
* second to add gs101_pinctrl_suspend() / gs101_pinctrl_resume()

This way, it's obvious which part is the bugfix and which part is the
preparation and I believe it'd be easier to read.

Cheers,
Andre'


