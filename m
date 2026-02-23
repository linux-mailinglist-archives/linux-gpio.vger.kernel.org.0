Return-Path: <linux-gpio+bounces-32016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNe3H/UdnGkZ/wMAu9opvQ
	(envelope-from <linux-gpio+bounces-32016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:29:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2AE173E88
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DBC0300426E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E00834E777;
	Mon, 23 Feb 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2QnR/OJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011021C84A2
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771838959; cv=none; b=ELZbA8BjQSxu8Xa9/suN7JCIm+1KNWz3YDJPZzi6aBYvSLd4pBHatF1z1+voe2CwkngCjKYZah3H5IH5NWtfpB7AZ+dKJkZng9aoSTuT3c7pmBVp4WLCIbG4OH/Es5qRUjjQe0gvoz8iT8E5BvJSgId6QigOCqwEEH/DYLAImUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771838959; c=relaxed/simple;
	bh=5srMJb3zht/X9YtE3v/FnkvrFNPHIet4G9W4E53K1y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jO1N/3q39nl5ep9V/QxHrFo9IVnduyGLprPRylkacQ59Tq1UesvIJW81r702ZnXshbscO2FnOJKFufAlloMFni5R7IQMUj5NEyx5Uv4I7rQzx4THuhq3ixyqq9EqWKq14G4P017Oog++6gja27X8PxdstlnCpfALED5z3GQr/Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2QnR/OJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69AEC19421
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771838958;
	bh=5srMJb3zht/X9YtE3v/FnkvrFNPHIet4G9W4E53K1y0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o2QnR/OJsIcWGjHMHe9aXlTyf9SnjhcXC0gyyYzNR98kbbLBdU8uvgrNuL9Fo+j5V
	 Ta8ciX2OQSstaSxmHrTvp8Q5IemHBp9USKMiEVYgTeD2O9BlvlJkcGOAlcdsWkbqRD
	 rde9bDgOmq/zyNTUCh4A7ynxfsYawtv+jB9P+ILZyJOlkW/WvTXfF5SkeKMQpnVRNU
	 Ug+WCJZjeMrqdhxEaYwCmN14jJ4rOT9NE10Yojyd0t30dVE1pGzLNtLUzl+tKIHReN
	 LYiTvuE+zRK2lH7eb4O5mhvvz3wjVEU59EbwqrKlJyKjXt3tsd+v6Zv6CWaGm8vSw6
	 IhYoomHoCbSAg==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-797d509a2f5so42285557b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:29:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmQMWH7/7LkB2XQ3ZEIGeXQZywOnFUGSDmDGygSHIP7jdHgMqcPhpX0upTSQGIAYJ3B4X2QYGFFABX@vger.kernel.org
X-Gm-Message-State: AOJu0YyA3Lrsz50ClBaSr1i7kyV3/hwDe1TnXgRAa9hMOChzOXJL8Oq0
	g4BZlnHmxN0iO2gR5xHWjDGodwVVGiv18KO3y/xIFqS2SGRNbPSQxbkA9WC18Py9nqPFoJwojyD
	StSWTD1aQDUuv3Z0gUVystVnorJD1peE=
X-Received: by 2002:a05:690c:e:b0:796:6df5:4840 with SMTP id
 00721157ae682-79829173617mr78587807b3.59.1771838958063; Mon, 23 Feb 2026
 01:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-pinctrl-equilibrium-v1-0-66909a3b0acb@dev.tdt.de>
In-Reply-To: <20260205-pinctrl-equilibrium-v1-0-66909a3b0acb@dev.tdt.de>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 10:29:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLkCdpoZBME1x_Jwz90q2Xj8uMf+tiWJJVH3yzxj3_W03g@mail.gmail.com>
X-Gm-Features: AaiRm52Xk69uQeyiojuGhwTHedX7R7s4vwUyH106vEyromc3MEmaS2eJ6je0hY0
Message-ID: <CAD++jLkCdpoZBME1x_Jwz90q2Xj8uMf+tiWJJVH3yzxj3_W03g@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: equilibrium: fix warning trace on load
To: Florian Eckert <fe@dev.tdt.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Florian Eckert <Eckert.Florian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32016-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tdt.de:email]
X-Rspamd-Queue-Id: EC2AE173E88
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 1:56=E2=80=AFPM Florian Eckert <fe@dev.tdt.de> wrote=
:

> The following series of patches fixes a warning message for each GPIO
> during driver loading. The core problem is that the names of the function=
s
> in the driver implementation do not match those of the callbacks. Therefo=
re,
> the functions were used incorrectly.
>
> For this reason, the first patch renames the callbacks and adapts them
> to the usual pattern used by other drivers in this subsystem. In the seco=
nd
> patch of this serie, the actual problem is then fixed after it becomes
> clearer that the functions have been used incorrectly.
>
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>

Patches applied!

Yours,
Linus Walleij

