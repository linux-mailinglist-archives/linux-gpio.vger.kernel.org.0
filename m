Return-Path: <linux-gpio+bounces-30106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C028CF0E3F
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 13:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D84030078A7
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 12:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0930C286889;
	Sun,  4 Jan 2026 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAjKuqd7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA0298CBE
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528711; cv=none; b=pr8yWlLNa8ReFGlr0+pp+yVUBncEq75MbRf8Ar1Yfdu3PSi5lC2xi9EhBDnlUlSGhBDv6NeQdYmxgsRgbN8PQSarHYX9bwAaZihdbuWssxDlP4B19kUs/UicLW4d1i694p+XqWg2uZmdAr1/SZ+2xCf9GGgCg+hUlXz9f4uJTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528711; c=relaxed/simple;
	bh=IyfZzVWLVpgkQtXvsL0weLDg8pdmeMpnxIyfAy0BjzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5pXgTFtP4ORCADpoLI9JQKpc4c9NknNzdJO/IYwVgIdBvzl0pfZWqhHeZg2yZ0lelSMhuIW6HPp93IrykItoODOjmuB1b/BhVdDuppLYCK/94KCBSdIN04YkAVD6IoNALHVxliKnZv8V+yui2JMRcSYVzlSzUUq05Moje/N2Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAjKuqd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678A5C4CEF7
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528711;
	bh=IyfZzVWLVpgkQtXvsL0weLDg8pdmeMpnxIyfAy0BjzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hAjKuqd71994mwT2HZ/DZJHgzTpfi1hPI/fwZ+tS8gBWcrckXkqAPArVNamC0nJtr
	 vJrhz0XIeO4msX4605RoGPqhRL9Qsnqqksl9KMqheJPAv0em6d9kRLX4Gb0jUKEWFi
	 2t2k5YQ8QXil08M1x8QfuKMlXTu3LCyN3z179wB02KP20dR4stxdxvtyReBt2kRQtx
	 f+GvTjTlBDLGRqi5hM6xWfxoBsBAh58nL7Te6yylQueUTOyqgGP3P5v9RyS6tZzDBq
	 32KEw/ALnv0zxsgeETvqRXWq8mDI2aMTjdSpxSTMTL1DgQbaGVYv1MBI7rRt2y0Pi5
	 Iu+wGV3InoHdg==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64472c71fc0so10812867d50.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 04:11:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJyQaAvNPumdpjbrgBO+Lj6sdb31nYoK5ckKT7+Xn9uUq2smXxFp1jp5DfYg2AS0z/7rIeXsIL0qQp@vger.kernel.org
X-Gm-Message-State: AOJu0YyoApJILFVgdW2DJ7dzhgTHeC2eBxyd+quU1I9WWyPx+yKuMc6N
	tk3DYeJ8WnPd0IWr+1qZrTIddQKRplkJc25KRCLTILe36g1bpnRdukqL2g7GHGGn8hQXhT0kyQj
	9NVU/Ao6teKxeiOTIlwyAqCzkzij+W1Y=
X-Google-Smtp-Source: AGHT+IGf+gq+RY7RDa2N3AbipgPiP7Hn/H+qm+mnCSsJgKdRlweH40nUGj21s9Esqf8Lt5jZpMj02xGGvWm2StzY5i8=
X-Received: by 2002:a05:690e:1488:b0:644:7325:3b2f with SMTP id
 956f58d0204a3-6466a8345eemr37335397d50.10.1767528710816; Sun, 04 Jan 2026
 04:11:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
In-Reply-To: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 13:11:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLmfA-UCuedK1Ddj7E2bujPDSNojVwQUu6gPAzMWhqH8Dg@mail.gmail.com>
X-Gm-Features: AQt7F2reGKqw5KViSoeA_7H4cx5N0CMhm-BoW8DGwrsddiCUPieqD8AhEo3d7OY
Message-ID: <CAD++jLmfA-UCuedK1Ddj7E2bujPDSNojVwQUu6gPAzMWhqH8Dg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] add gpio-line-mux
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Richard <thomas.richard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 7:01=E2=80=AFPM Jonas Jelonek <jelonek.jonas@gmail.=
com> wrote:

> This proposes a new type of virtual GPIO controller and corresponding
> driver to provide a 1-to-many mapping between virtual GPIOs and a single
> real GPIO in combination with a multiplexer. Existing drivers apparently
> do not serve the purpose for what I need.

Thanks for persisting and doing this the right way all the way through,
Jonas!

This driver will probably be helpful for other users with the same
quirk in the future.

Yours,
Linus Walleij

