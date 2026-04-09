Return-Path: <linux-gpio+bounces-34922-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOWYFphe12kCNAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34922-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:08:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0023C77F3
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62DFB30046A0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B6238F941;
	Thu,  9 Apr 2026 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQS3kITE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77EE38F632
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722129; cv=none; b=p2OyveurLBqZQPYedGOT7XQmttAV/bHAI5dqmx21zsOQ9Bgu4iubbrOKXhFNyQgR8CUdVJ+EHMSjwrpQskJoLz7higMfxohVo8ToJGpvbguHhbDv30S0IzD3g0qp4kQdxHDAt7WUCWWzoakfkfFIAFlAVwajZihdJWc8HIZEjAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722129; c=relaxed/simple;
	bh=E6cVnBM4Wihu3vyKUFn8rmJXguE0y6A9+FlmYJgfIKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtYmbu7sk0zWP38tAuE7vLEN48YHO2+enW9EIeLuQAA3vckzvTvnBAHCWrmkPvdhIPdNoNma0Br30n6xP8MDwNQ17bvMmZxQP+ePij/2HKQ1XLIDFIKxkQjDym1NFBtrIAvIhnHGqakAbkuCfz21bdBD05xa1XPad4ueaj86L4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQS3kITE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B58C2BC9E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722128;
	bh=E6cVnBM4Wihu3vyKUFn8rmJXguE0y6A9+FlmYJgfIKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FQS3kITEkgcrUdmaeO2L6S9zDWyAf/c9Fjf6Hy5L6rYpcZCD86htMW4YKe8DdHQMa
	 2f2PpzJufpVcwbnhaeiAKhJKt6yGuHjvM8LaPrp1BY46dCZqlVxifAvbpQ/N/mx6Ja
	 orH1V14vxP0dJ3dBgjRkKi5Ak1t+SIcVuBcKGOJC8Lb+5HU2ApttKFlsgcULe08D8z
	 8HTEdf8UswtbWLDYVWcl8m/XvSAMV1L4c68C56Ye8tS4UASIQ96kuiB4NoL1ChUG0F
	 LviLx66Ivzs1s62wfUVQS+CEtaaf3jiyojKyd9lvG0fOBFXSHzX6xRDr0oS9BLvPjA
	 zIDfH+BY8cWBQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79c20063a32so6515297b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSiel6PHJEaZoTJkKiu8/ZTaxyLCGyHJMBF/FkFK9dv0wPv4LMYnkohUpX4g/PjCCVuL3a5p4+oEp/@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhs2xSirW/guLo2HeUDihtg9Z/US5KbHXf8BhCbQ8e7hUEfcW
	5K0dv6qLK2H7LKQNqjLZCVjP5M/z+Rt54K27L2BSjgh1HoJq2jC9o9GE21pVDhwwlLCI+WBNTjf
	WIM47Ae2wlurkPrpPDjsC/RKApll2od8=
X-Received: by 2002:a05:690c:e3e4:b0:796:335a:895 with SMTP id
 00721157ae682-7adec6e60c0mr25137627b3.6.1775722128030; Thu, 09 Apr 2026
 01:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com> <20260407184805.807328-6-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260407184805.807328-6-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:08:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=yJFdyOrnt11SwxOi7wowZA_PK7g9ttd-HYz+KSnZHTQ@mail.gmail.com>
X-Gm-Features: AQROBzB9Ba7WRFIdllo03EWBOZPdQQniIwixxePWLmVAE4AzRNEqmOWL19CY2I8
Message-ID: <CAD++jL=yJFdyOrnt11SwxOi7wowZA_PK7g9ttd-HYz+KSnZHTQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/5] gpio: mmio: add port-mapped read/write callbacks
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34922-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[duagon.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F0023C77F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jose,

thanks for your patch!

On Tue, Apr 7, 2026 at 8:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Implement PMIO read and write callbacks for 8-, 16- and 32-bit
> register accesses using the corresponding port I/O helpers.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

Overall this looks fine to me, but with the change that it is moved
over to using the union.

Yours,
Linus Walleij

