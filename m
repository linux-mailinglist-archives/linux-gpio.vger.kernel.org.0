Return-Path: <linux-gpio+bounces-30346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E2DD0A6C6
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 14:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0FF6300F72A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 13:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892F935C1BF;
	Fri,  9 Jan 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gW1hVODA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E754763
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767965190; cv=none; b=mT0gyUc224zcDXzkXWrGvJrTcsw37tU+64Ml6thfk7eEj1nRKZ3Us484BCiGYiGR/qb3AI/DEDKMoYUkIS7Rp0BQtmEmIB+g5WcyoUTlF2iqEVYOCmhN8sVKvkDeFQLMK/Ufrs4/KKyKYnKiTmZQz0p1AOS15S3NcZB4i1Tr6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767965190; c=relaxed/simple;
	bh=vO9DXahRrwSE7C251oFRfy0wup+VwWVsJpMTS/ysw20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrRLotVesuq6/j+QA1MeEV7KGidKYwPHCy2+pX1TaDxZELRFnS8/q+xI60DH9PqaBjpZrTbKto+vIzzilsQE8lgLCxXHMxtKttOeeap/BAF6cx6aeWm86bvbKdd0Nnm2x8FOXBmX6JB/9LD5SgghtK7kqFau30TN14WFQL/ROXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gW1hVODA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CB5C16AAE
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767965190;
	bh=vO9DXahRrwSE7C251oFRfy0wup+VwWVsJpMTS/ysw20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gW1hVODAGsJQYEncKOpLCb5nZrGP4ssWU6tHGp06fWphrewncgOCfk7gDlWTR7D76
	 oc/1b2NZKhZg+qBKX7cfZeDG2GGBmRsYurdxVgm6xybo5LQDoIzhg8Q6IFUqrfi6At
	 QI7yEf5HpkrCTlqyK3Gy1U3fx2EK5Un0VbkNpL9b7cMdmaPs5ReaQOR2ulWiMad9M7
	 9BN7Ow+4QxdaHiWiQQNZiggY95Lr00Md4FJlvj8W+zH30BGGaD2GNITfM/iJPgcJzD
	 zzphBSpBhHuib+1ywXlCRXnCxgADl5L3Dd/s4Izj+GfsIniXGz5+I6ZdN0NLy7bKV9
	 b8YZLvYCYwaKw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-790ac42fd00so37411687b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 05:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXL5+Su2/UGt+eF/xDWzARfxlqAYgtMBuQxtf9VLX8Qxmlt39uN/I4yA0QY3GIizJb6Or6uIscCWvZw@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOQeDm7l6+2mY7zjrCRl5IJ2roI8PYJ7wIDyJ4iPv4RzrDmhz
	mlI/gxPpBVY6aL/tbMeOYsB8uDdVSpXVFn+lVRbcpsPbgMv3ffGmWYyj4zQ/IVPvR+QpMj7KR5+
	PNo3oBv7CbeVC4oOqNAij558GoEKETBE=
X-Google-Smtp-Source: AGHT+IEaCxcdqspbPVxp6cvZDXuRYIpyM2Vwk9EQbM+AWYmjMRM/Wb7p5v6tIl7YS9DvSDib25+VbFW4g1H1Q7VbfxQ=
X-Received: by 2002:a05:690c:b08:b0:78d:7307:76a4 with SMTP id
 00721157ae682-790b572d352mr195860837b3.11.1767965189342; Fri, 09 Jan 2026
 05:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 14:26:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLnn+=Zs3quHWS69K_R6XQv3=KnZwkQDCir1qBnmyhn8WA@mail.gmail.com>
X-Gm-Features: AZwV_QhYMawXOGyHsPF_guEUtGRVKGlMgIGFHwiU9pBACa4x7RRw8_M1vura81U
Message-ID: <CAD++jLnn+=Zs3quHWS69K_R6XQv3=KnZwkQDCir1qBnmyhn8WA@mail.gmail.com>
Subject: Re: [PATCH] driver core: make pinctrl_bind_pins() private
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 1:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> pinctrl_bind_pins() is only used by driver core (as it should). Move it
> out of the public header into base.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Oh good point.

I guess technically base.h is Greg's file so I'll wait and see if he
has something to say before applying it.

Yours,
Linus Walleij

