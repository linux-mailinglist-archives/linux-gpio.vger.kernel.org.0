Return-Path: <linux-gpio+bounces-30022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AAACECA09
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 23:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5024E3015EF1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 22:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B350130F7E8;
	Wed, 31 Dec 2025 22:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F34k3LsS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733EA30F545
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 22:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767220137; cv=none; b=SgrJgYDDxumufmGg5IFHQbKvp120tPLKUWOcJg5qqv7NxZhgh1THLf5AXAYZIpYBVdjzEo2Hz7Nn6hyQXoRTs92OtNxBPinhjMG3UpUuH6rscB6X8xzduTHtGiUVXHtPNNx1lOat/pRj+1I5t8StvfDcQE9Pkx5Nt4avwlvjZ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767220137; c=relaxed/simple;
	bh=26iiet+cdpcowdyYtX30PosXDJtjhJu4Gi4yzc1GQzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+KUMJ7sZEoZ5wQRKC+asn7msVmLIuh1sxdAA/5lK1LlFEsXQGClu8/vfHDTZ9kmeuJbuQXry9mWhJ7QXs+F6Cs+77GnQ6h+IMQeaL7K2HgnBsyvrDtoIGQISbmhqxFcuEDN1EF5IH5wkjuRV/wvjOY/oZ87/QTpMMOU5NV2xw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F34k3LsS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC02C113D0
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 22:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767220137;
	bh=26iiet+cdpcowdyYtX30PosXDJtjhJu4Gi4yzc1GQzs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F34k3LsSrr6e2s2xq4FKnie18feKwQtStYamKmbJf2HSm5CH1rERz8MXc7goFw1NM
	 g7gcBPKpKJVbaz0+8w6WpcKizldlOzuXGHbS2bM0a7JmdcjHSZgOqQrfKuwmDqO2Rp
	 oa0V7DmzNTtDAyPjpzuqZTeXGIzIUCAiR0vAYPvwbJrrXWybwC8DIrCYCS+zBbe0X5
	 5OJuXmaLZOpDQcZsbXuoby2PyYnKGjr/h7Zv262slYOsbuUuzem6cFbLmOHivrhv8K
	 P2JEMx2yGvVRRodw/BX85PHvGbNO+VSAGcSdhs+cgCQQDXWQW3JrtyMGStiAB2h6D0
	 r02FxzV8qe1xg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78c66bdf675so96955747b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 14:28:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIjtD3bhkmUt/Rn7DWDGUlEWpahf68YvGNkXVhPmpKE/Y67pY6yTWVNN+4mWTVH+FXjIb4L5Kv4N/A@vger.kernel.org
X-Gm-Message-State: AOJu0YxEG+dA8mhCuVw3xnyeFXza4LzXldzHnvxIb2wszDNSGRHUrySN
	WqRNRHHRBYTBmk/6rC7z1VUwEVw/EP01pdgNbzOjxX74q5vjKBllUcK2Ed1OHh8j6McMgg19K3+
	MTVsPzk36cJRkXHIvHKrKNjitCTcamjs=
X-Google-Smtp-Source: AGHT+IF4tBxaJDYxmgz18I5l1LhAGbdnGy/RKG7PeThu4226NLShduLSXw1Rv+CkXJ+drwnVCo1gNClzGqn8/Pzhvyc=
X-Received: by 2002:a05:690c:600e:b0:78c:5dfe:1b57 with SMTP id
 00721157ae682-78fb4144855mr337082097b3.38.1767220135578; Wed, 31 Dec 2025
 14:28:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de> <20251212-wip-jremmet-tcal6416rtw-v1-1-e5db1b66d4cc@phytec.de>
In-Reply-To: <20251212-wip-jremmet-tcal6416rtw-v1-1-e5db1b66d4cc@phytec.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 23:28:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLn9KvFsZA_rNCc9ZMCkG6-baeaMzczz2Gsu=36Gv7YOxg@mail.gmail.com>
X-Gm-Features: AQt7F2rWVuROE9AOE_ZxlrbhoruVLnwjnaIrhDTmWKo0_w4RrwVr7H5Vae7IKIQ
Message-ID: <CAD++jLn9KvFsZA_rNCc9ZMCkG6-baeaMzczz2Gsu=36Gv7YOxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
To: Jan Remmet <j.remmet@phytec.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?TGV2ZW50ZSBSw6l2w6lzeg==?= <levente.revesz@eilabs.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 2:03=E2=80=AFPM Jan Remmet <j.remmet@phytec.de> wro=
te:

> TCAL6408 and TCAL6416 supports latchable inputs and maskable interrupt.
> Tested on a TCAL6416, checked datasheets for the TCAL6408.
>
> Datasheet: https://www.ti.com/lit/ds/symlink/tcal6408.pdf
> Datasheet: https://www.ti.com/lit/ds/symlink/tcal6416.pdf
>
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

