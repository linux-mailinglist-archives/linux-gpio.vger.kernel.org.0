Return-Path: <linux-gpio+bounces-34930-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJtKGpxn12myNggAu9opvQ
	(envelope-from <linux-gpio+bounces-34930-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:47:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679C3C7ED0
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A662300899A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7E735F16C;
	Thu,  9 Apr 2026 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BARPx+Sm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB0324B1F
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724441; cv=none; b=DHclwDJ7FiLo/4GAYXhJTu1wAS2mUkgOuoWbNNeceNQhJ96bGJEUDaNTtMGkoOLwO2MFMxcF5mtV+eo01jk0EpCg9gfTmBuKPjCP+XcS4hskmij6hfQp2KP339w4pLHQ0FBOQ65TLhIjEC6gpZc1Gxe5GgzM+HHUt3B8G3a/qB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724441; c=relaxed/simple;
	bh=FhoqXLreX/BLdwXmDMi/YVzFa/SUVXcXnQnOklrPkYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdNfkLVy8SAq5wa4iNmUo8hq+eemPNoYJ0YNX/HvIvyfV+tSxlG2kyjUbdLgPE6XrfJ6bkGkqn8IMMyF6+pkDF2kbbvuLI+MkDpsB0MYDfKJuDWK4hzXKvm4BIJZBbp/QG4W0QyteXv4CtiIyfXT4AhT4hLdM7kvwy6yzMRLgbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BARPx+Sm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C154C2BC9E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724441;
	bh=FhoqXLreX/BLdwXmDMi/YVzFa/SUVXcXnQnOklrPkYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BARPx+SmrdAjYotD8o8UZliyK2PlMQInpQpasCwiq1aI8uGW57GvEpjZT52D+AEJd
	 0wOaILYuVAWHmm0HGN88AEztH3nEFCxqLIEn+VKJb3GRcRwde5EtRASic0nBf9zHtI
	 GKqnKEhsZ4Kze/ZkF70Sw0Z04I6rWCTiKkIgz/JWutPiGdKpx32EX9hz7wMXTcLqrN
	 ki+q7WSfeFTeBziiXT1FQKxgFxSfCwe6lU/rZJJy+VBa7HIhmqtZZq4GcmMFcIBvpG
	 JG74s1nUIgwXwyeICrjjJ4ACuS1+RombSELmyirIVcA9eZCGeig6DY6KZ6Ax08WMvA
	 v23F7GS/EfnYQ==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so7034657b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:47:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVs4qQ9UFH0IhfyvhkLENSoZqL2ldQTdBKTzOu8Ypy20XIdiZZuYVFr9HiHuVluCPbFoMzomSJusXTr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2v8v20mffy19mRjzAljxiWXfGNOvOSGQLJL/FNCeHs5pMgWBV
	Fe01y+KAD5hOsZM8rTcewqore4L7xiL7jWLxw0BvOWfixjyiw104+ozCpyPinBpyQGTfy8/R/ZG
	X54BkZ51QG+Vy79Sixw1oRETJ5b7CeRk=
X-Received: by 2002:a05:690c:ed6:b0:79a:c7f8:d95c with SMTP id
 00721157ae682-7a4d5b4dc8emr230824317b3.40.1775724440989; Thu, 09 Apr 2026
 01:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406075114.25672-1-clamor95@gmail.com> <20260406075114.25672-3-clamor95@gmail.com>
In-Reply-To: <20260406075114.25672-3-clamor95@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:47:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLkTF+-qaKsmOtjajPdL0Xdt6_hiXaysUrh-qrvjU_Lgvw@mail.gmail.com>
X-Gm-Features: AQROBzBahChtljCTZBs0lkmpK4Rt75xAc3CX7ZbX_Bl5LHWdhOmPTzY0tf2nAuE
Message-ID: <CAD++jLkTF+-qaKsmOtjajPdL0Xdt6_hiXaysUrh-qrvjU_Lgvw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34930-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0679C3C7ED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 9:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Patch applied to the pinctrl tree for v7.1 in accordance with Rob's
instructions.

Yours,
Linus Walleij

