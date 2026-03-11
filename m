Return-Path: <linux-gpio+bounces-33088-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKbZHOcvsWkVrwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33088-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:03:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83725FEAF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A69F4301A40C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A213C73D9;
	Wed, 11 Mar 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvMXL9fb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2063C73CC
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219806; cv=none; b=eyLrIw5/d9k7E66X4Urqq9bOXhkA9qqZbVgSh53Cz+v3acgJioI4wd1OAFUyJLCFoiUvz8fpCXSicMlVT/yepX/6oM2rBdlrswM+ltuq9rvLoI5dFxONfgnLmr+sRdc0Kb0E28jXJ37jHBqV70d5rvczLKQXhQqRqryUFxHJESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219806; c=relaxed/simple;
	bh=BQS3KUm8OQjIX93jfxtNkYI9z4nKh5FJP1G049uo1P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1Qc1sUxgt18IBmegq2MeqBM8SNR+yN9E8DiawmiUmuMwkUffMfSnDAwLA04s+K6HX/QZehUdwU4l++tgwePd8DszL41J8O28qe9MiPGLTL6a9VnamKcs8vEi7AhQjj7U72Lk73QFVbUu/igX2QRGHaQDq3hjxim2DITG0zaUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvMXL9fb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7FBC2BCB1
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773219805;
	bh=BQS3KUm8OQjIX93jfxtNkYI9z4nKh5FJP1G049uo1P4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QvMXL9fbEAsrNaulZ315J1Jwr74orxch9PLbcG+NkNIuEEZkjRjKg8d1FpYOx0v6x
	 WyQpGjOWRgLCSqtlyJ6ZjD77lKwr3rxNfEFb62EqqmviGledmdl0Zusw4aMwwodATY
	 GVYVnRkas6jeWidLF1WGS8nrhi8X9FOFLwVYiiqSr6a91T1PfKGOFT1CGep57sIiGZ
	 DHH044TdtiRrV+i60+8BF5yMut2ojXWq8e3lqCBkCTIO/5psCGYyw3fC9kKZR3q/my
	 VnBQNOZPVZ0PZRPkp/A5UcJrEioFTXEKMdPdXohf5TqE9l8eRVDM+PzNIzpNUWMazF
	 W2e+PVk1xPX3g==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64c9a398bc7so12780386d50.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:03:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YxfKdtAg9b4z8Bl1j2W9/Wfx+ijbgkyz+pglcmejih8SPc+vh4I
	BFhI63t9abBHz3TQUXxvqEdQEOdPOtmNZT8lN4MEEbLEdhuRJyvT89HhPGenEw5fW+PvNihEYC0
	KwQ7se5ohwAJRyWW00wRLRB9LMi7Ag+Q=
X-Received: by 2002:a53:ec85:0:b0:64c:a63f:87a with SMTP id
 956f58d0204a3-64d65853949mr938325d50.79.1773219804991; Wed, 11 Mar 2026
 02:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311025541.53814-1-rosenp@gmail.com>
In-Reply-To: <20260311025541.53814-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:03:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDbs7aAbVnS3Y=xzYZuazkELxoXN-XmeMeJWYFwNAwcQ@mail.gmail.com>
X-Gm-Features: AaiRm51Dig3_h2M69qJOjOwvCe-yKwAZ6MTyR3MSK2Qyck0cUFVFycu9lBlp-gc
Message-ID: <CAD++jLmDbs7aAbVnS3Y=xzYZuazkELxoXN-XmeMeJWYFwNAwcQ@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: virtio: remove one kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6C83725FEAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33088-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 3:56=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> A flexible array member can be used to combine allocations.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

unsigned int num_lines;

> +
> +       struct virtio_gpio_line lines[];
>  };

struct virtio_gpio_line lines[] __counted_by(num_lines);

I'm starting to get a slight feeling of d=C3=A9ja vu here, we
want to use __counted_by() for all
of these.

Yours,
Linus Walleij

