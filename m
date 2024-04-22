Return-Path: <linux-gpio+bounces-5710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A38ACB37
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 12:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE191C208F7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 10:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016CB481DD;
	Mon, 22 Apr 2024 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUHScp/8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E3205E38
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782977; cv=none; b=d47qnWR7IYhXLpuioISzfspRsvxXE71/PUOFFXFbipEREQsDRBzKhkrjIkW37IfhCzmeNSvcHjx4WBaeKCMq/k8ePGzEaEVg4YVTxiAnuKSVuQOQ+DjKUtB4y1h/JTBHlrAouidP3vTNTxZ6rRDdLrH75lZ/eg+h3l/HB0SZOvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782977; c=relaxed/simple;
	bh=MSgaIq6vFVrG+Bd/mmoMgGRw/81lVUqASzuGDmfQUvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiF5va3HJaIJk6wSV/0bVsilho/O/8xuhTX3DSK1EzE8BDa582yxnOUqfojIdmvp71fv5EM6a70t17MChW0dxTXA2GNYHOto7HceSRcuWXrPo6vB1JNCDNtLkAKm109sLV1y+RsDKjjIAtPD+altI+a0utaEeBAAUWhDW7zq3qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUHScp/8; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c70999ff96so2645140b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713782975; x=1714387775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wCCwoRdKJhCHGpJd9PxrqHyRj74wPSMq6YviT3yZjQ=;
        b=iUHScp/8wgj3Gfwo424qoB0AiQHDPsJfVPhR5RTW77Ph33rqvneA2N3DtWONu+VuG/
         h8d8tI9+ZkZy/RoL73GHC7TREWeNY110rusFc3P1Bm1PEZLODLBe7CPWwJR5mMLq7gnl
         ijrggCZqRvH1NDttH/z4IRjgnptPSYQRHJbyvGMjoEJ5PRVx8ZHrYbP0FhsAP2ZU3EZS
         Db5WQycO1XhFvgc+txMNvGqa4TO3kuUWEU6k3LjImhNOExByDSbTGNWvfLxUeptdgBZE
         bYZEE9s4pHA7o13gL8BW+SvEzXOaFG0Aab/twbwrYWKLMyyj3iWvHjbqj0Dv21/1OagW
         wiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782975; x=1714387775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wCCwoRdKJhCHGpJd9PxrqHyRj74wPSMq6YviT3yZjQ=;
        b=ldMieJjae2KDZTKFqbjVYu5oQlCTZJiYlIz/o76dMH/7YsAb6y11IdKeVJH6eJLC+M
         dVIHLPxwrnw4S8M90CQ7W7q+L2T27RUrdtnpOt0R6aURiByInc72isWKQapd6U9/tQgj
         zm7X+Ex41XymBoMveEKGYqtSTCAbslXOjcWQDcrxPwlzsoR9EJNYG8kwFkk0rsuipfdI
         IobEiJEhg9EHDGYgDzoFfuB65JwRxToubzrmIa2gub0o9N3FH2CMIGtfnyZVMB9EHMp+
         9uFdLSei4EtF2CqzweaHvjarDuKA/mq8S9FbH0Hl1YoWTRId9NpGayXZGeyZlaAsnnNo
         3mKw==
X-Forwarded-Encrypted: i=1; AJvYcCVOxqbnAJN2pwQscRVV7V8oBH4BGpmX5H0QYp5UmJIUMSYiKpp0SRCWxNNC1mwjHzqpGmEgO4jyZyFVOILDgnrnsX9tD/KOav9SJA==
X-Gm-Message-State: AOJu0YzuQeMcB3CPkjCLNJlSUjzqzKV9YCLqQDTyLdQO+d4JkdBUcLmQ
	xAmM2mmIeJLDkE2WU4npjZrL8ObrGlwb79maFyKWU8rtfTBRK/t22/96et4eMrEDSYf7ZBS43zo
	VJk0Adk7h7ha5VOkSBCiw5bmJJ1NTDwh5JfvA7A==
X-Google-Smtp-Source: AGHT+IFEHPg3T7oe8vbsNCk4s8UvW89ZVEensdAkiOr24MNYoCE9jhFTbt9hAWcHqruDgqJhMro5EHkYWXZfTQSAbn8=
X-Received: by 2002:a05:6870:fb91:b0:22e:b736:786d with SMTP id
 kv17-20020a056870fb9100b0022eb736786dmr12108386oab.31.1713782974899; Mon, 22
 Apr 2024 03:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416212141.6683-1-brgl@bgdev.pl>
In-Reply-To: <20240416212141.6683-1-brgl@bgdev.pl>
From: Grant Likely <grant.likely@linaro.org>
Date: Mon, 22 Apr 2024 11:49:24 +0100
Message-ID: <CANH6bkDZRVApDNoBoYJYN+jUEAnVpWFBr0fSBR+gO1Cjz2-WCw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] licensing: relicense C++ bindings and add a
 document on contributing
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 10:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I'm Cc'ing all copyright holders for this project's C++ source code since
> the last license change which are Linaro, BayLibre and Kent Gibson. Pleas=
e
> kindly leave your Acks.
>
> Bartosz Golaszewski (2):
>   licensing: relicense C++ bindings under LGPL-2.1-or-later
>   doc: add a file explaining the contribution process in detail

For the series:
Acked-by: Grant Likely <grant.likely@linaro.org>

>
>  CONTRIBUTING.md                             |  88 +++++++++++
>  COPYING                                     |  11 +-
>  LICENSES/LGPL-3.0-or-later.txt              | 165 --------------------
>  README                                      |   2 +
>  bindings/cxx/chip-info.cpp                  |   2 +-
>  bindings/cxx/chip.cpp                       |   2 +-
>  bindings/cxx/edge-event-buffer.cpp          |   2 +-
>  bindings/cxx/edge-event.cpp                 |   2 +-
>  bindings/cxx/exception.cpp                  |   2 +-
>  bindings/cxx/gpiod.hpp                      |   2 +-
>  bindings/cxx/gpiodcxx/chip-info.hpp         |   2 +-
>  bindings/cxx/gpiodcxx/chip.hpp              |   2 +-
>  bindings/cxx/gpiodcxx/edge-event-buffer.hpp |   2 +-
>  bindings/cxx/gpiodcxx/edge-event.hpp        |   2 +-
>  bindings/cxx/gpiodcxx/exception.hpp         |   2 +-
>  bindings/cxx/gpiodcxx/info-event.hpp        |   2 +-
>  bindings/cxx/gpiodcxx/line-config.hpp       |   2 +-
>  bindings/cxx/gpiodcxx/line-info.hpp         |   2 +-
>  bindings/cxx/gpiodcxx/line-request.hpp      |   2 +-
>  bindings/cxx/gpiodcxx/line-settings.hpp     |   2 +-
>  bindings/cxx/gpiodcxx/line.hpp              |   2 +-
>  bindings/cxx/gpiodcxx/misc.hpp              |   2 +-
>  bindings/cxx/gpiodcxx/request-builder.hpp   |   2 +-
>  bindings/cxx/gpiodcxx/request-config.hpp    |   2 +-
>  bindings/cxx/gpiodcxx/timestamp.hpp         |   2 +-
>  bindings/cxx/info-event.cpp                 |   2 +-
>  bindings/cxx/internal.cpp                   |   2 +-
>  bindings/cxx/internal.hpp                   |   2 +-
>  bindings/cxx/line-config.cpp                |   2 +-
>  bindings/cxx/line-info.cpp                  |   2 +-
>  bindings/cxx/line-request.cpp               |   2 +-
>  bindings/cxx/line-settings.cpp              |   2 +-
>  bindings/cxx/line.cpp                       |   2 +-
>  bindings/cxx/misc.cpp                       |   2 +-
>  bindings/cxx/request-builder.cpp            |   2 +-
>  bindings/cxx/request-config.cpp             |   2 +-
>  bindings/cxx/tests/gpiosim.cpp              |   2 +-
>  bindings/cxx/tests/gpiosim.hpp              |   2 +-
>  bindings/cxx/tests/helpers.cpp              |   2 +-
>  bindings/cxx/tests/helpers.hpp              |   2 +-
>  40 files changed, 127 insertions(+), 211 deletions(-)
>  create mode 100644 CONTRIBUTING.md
>  delete mode 100644 LICENSES/LGPL-3.0-or-later.txt
>
> --
> 2.40.1
>

