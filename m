Return-Path: <linux-gpio+bounces-30460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABEFD13F10
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 17:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9103A30581F6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 16:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E276365A0E;
	Mon, 12 Jan 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBugEC2t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6EF365A08
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234601; cv=none; b=s/VOV3NyAj5KWSarfq0zXi2mcG2sgL2alJSQSE+0LFnKFV1C5kLBCQvHHeCEZ+5c7HRL85/4JRGHf1jKmViHC8rzsDlghdykaRbc1N5NZjHooIipvQLB0S7x1vNEWx7Usg3rDOPcJgwEpLrQ5TcCKc2CVxl6DlPYOzrbiRqoxpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234601; c=relaxed/simple;
	bh=z0D+kks62pgegZV2XdqBFQKhsdGUA1pYhXHbdmpQH3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6OlYYs9oHGxWFUklNxpIBaF1XS46WB5QsRJ6bn9GEvIJyhM4scedw4VLkyDZLJl8dFt6G61SHsPmdCSAuITn32JRONcsB3ZGPSBYAzn7QoBy56StHuolZHJmjt1lMQEfcnZrDANV/Z1y4WqHsUt5cC5xrRn+PYeEW2EigzJSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBugEC2t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E154C116D0
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768234600;
	bh=z0D+kks62pgegZV2XdqBFQKhsdGUA1pYhXHbdmpQH3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EBugEC2tQCEQiUhjzILrGVvD0JJlwFJuMuJHc0yYX5gMPMo4jlShS7cKbsyv8l7JV
	 NNk+e0iYP+PUbqVOQ0dvVBrZxAgMU43W3e3/1TCjrklpkEFkl8qIBSx43wAsF6VRjJ
	 mlKksLlym8mr1R99HtNIFWlbsU2V515fDRsXUklnSs8HLKzadyjXyx3ofaVkZ/az4B
	 pCEf4dV+N5CPPxax+RazO9yIKV7RRkCAave5AMCuZ2i1yAhGHx3ueldn4E0wmqL8G1
	 Yr2ce/Q0lprP+L1toLLaN4bi/HxPa74qN9MDGKgMfFi0VQFfBvTSPSXdRzuRFJAN/s
	 7xsgSGupcmt2Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b8364e4ccso3700801e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 08:16:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeo8GM/ULS4HbLDQY5MjzzV318rwlS8jO9EvMWrWRlBxqvmZgutp7gqCHfIN/CBywhVKutwhYdXISf@vger.kernel.org
X-Gm-Message-State: AOJu0YyPesBtrSVn7TtQQltxxy6cDXtW0jW8nkLfZvaPW6be+u5HBgdE
	G90J6PfNxWX6PXIKCmWqezl2B94c5/jOAHhaVZi9Fg9H/hv+v4k3gyRUovPVKjgWJ+TWYypz+tJ
	hK0vLm878EMHYLfT1md9VCbDF8ucNTXo=
X-Google-Smtp-Source: AGHT+IGpidu88bI10yHqzleK8HEPnMVL3wkygkIfnHiAC80d9chHmyCWYJ17j80L1yIwn2cFIaGA2I7sYXdg5upl3OM=
X-Received: by 2002:a05:6512:4004:b0:59b:7864:9776 with SMTP id
 2adb3069b0e04-59b78649935mr4713341e87.46.1768234598010; Mon, 12 Jan 2026
 08:16:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112064950.3837737-1-rdunlap@infradead.org>
 <CAD++jLnrcsEjKpBQWL=RHKVyyfq1UDk-sDZ7MP-16z0hBLC_dA@mail.gmail.com> <CA+HBbNFKyOFfhRu=XAE891dREPatFRD9VJ5=upz6xPBb8khGjQ@mail.gmail.com>
In-Reply-To: <CA+HBbNFKyOFfhRu=XAE891dREPatFRD9VJ5=upz6xPBb8khGjQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 17:16:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPt9M5HEtN4psbk7Du8j4Y6_a0YzhxOM6wds53jT3kHg@mail.gmail.com>
X-Gm-Features: AZwV_QgjxMyqlI3jrJOiQTa3nS3d7KSkF-hmwennVlPIka7VAyMMdzR0TUaIOrg
Message-ID: <CAD++jLmPt9M5HEtN4psbk7Du8j4Y6_a0YzhxOM6wds53jT3kHg@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the gpio-tn48m driver
To: Robert Marko <robert.marko@sartura.hr>
Cc: Randy Dunlap <rdunlap@infradead.org>, Lee Jones <lee@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 1:24=E2=80=AFPM Robert Marko <robert.marko@sartura.=
hr> wrote:

> It would be awesome to see it in the tree again, as the drivers
> themselves work just fine
> and allow SFP-s to work on the TN48M and I have patches for TN4810M
> (Which is a SFP only version).

I sent a rebased version of the old patch as v11 of that series
so Lee can pick it up and we sort out this.

Yours,
Linus Walleij

