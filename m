Return-Path: <linux-gpio+bounces-37583-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD/QGATwFmpcxwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37583-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:22:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D02CE5E4D68
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFB013181A01
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 13:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EED6405C3D;
	Wed, 27 May 2026 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRGPurKd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A140C5CC
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887743; cv=none; b=OldKaXR5ZrhEGUuCnXh4LrdxvYg6DwB3njovFWe29sJMbmQh280XQYYBG2JntBKJtLhM5Ws6SxcDdLLset2isSSToke4/Qmc3JGU3jaUn463uHXMfN6KuZSxKrEvd8FSCeqnULR0zTcZNcIAjtRUvf/B7Xjhb6DTTFEiWwbOtM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887743; c=relaxed/simple;
	bh=0kBtW3eK/5g2kLvivBtuqbvM+kYyF2/OS9Ez33b5HOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eimeX2a+ZBeKQXl6z41ngEW6OKGuR1fLh1TolWql5PqZufnE2X+Tg3mwzrcTvvgPTciTE/RKuvhPoB85OtHrGb4zAeEXM0Ejy25KD3DzKkb3cA4WBlp/4zkKjirvXOKI3snpjA9pasGvJTVvdPzNiTmrJPiZ9/l/F1prPqd2iUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRGPurKd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F4D1F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887741;
	bh=0kBtW3eK/5g2kLvivBtuqbvM+kYyF2/OS9Ez33b5HOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XRGPurKdDfdIWGQ0RUPsNJ8xhRjyGxAJlYknp6FP2tLICM9P0a9msA6OKbk2YLmZB
	 8btINQ4C3mkJh+QoBQ28wHCscfV8PNb40oacXdjunIV2YKHIbZz/RyPG9WOIT4VFSO
	 BzPR7iWR7+AbAoupdfltmPZDhZFPnZciiNOvYH9X20o26otyMNzGO604CWfZy+RG3x
	 bjzDWZH2zqcHnQVKP1zY37PA8rxSGmJtfV38QXEnGqcPZ7g1YzAg+Y34fthMtTEBMl
	 eTgIBkR8lrH/D4zlOlg0cj9Htqt/P0pwj/+VZcQhWBL5Z5WWG2tSDJJIWmtb8LiXEE
	 N6RItRXQ+G3/g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8721851e2so13091517e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 06:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rIS5/luRDzuuJMh37g6RT+LEt8oDYxBt0eoWgiGid4xCRDzGYPTyNXTWS85HUWPq1v8t0mfk9QCFF@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXDCeVw7Mo/up5WZrwhd7mvendxg3P+/6IbFTyO2jBVmOnnCg
	1UHR5SoE4bMl6X0fa8q+wQR1qENXTeNT31okZ6TVrVzW61Idxhx1Y0bpVHJJBdkn14S4q8G46OP
	NtX1lv6+arwpzCjEj+t1S9XyMXdavvOI=
X-Received: by 2002:ac2:4839:0:b0:5a4:1add:c56e with SMTP id
 2adb3069b0e04-5aa32328fd2mr4719434e87.11.1779887740531; Wed, 27 May 2026
 06:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511183002.228520-1-kmayur809@gmail.com>
In-Reply-To: <20260511183002.228520-1-kmayur809@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:15:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=OfkGMJMsevYRex_85pm=-xMN5-DjbbCgXAXtkfpPjZQ@mail.gmail.com>
X-Gm-Features: AVHnY4JrPo3eLZQHa8Kr4qpK50Dnd5cujP8cExxfw-lR9epeKnnn0hWheRnamH8
Message-ID: <CAD++jL=OfkGMJMsevYRex_85pm=-xMN5-DjbbCgXAXtkfpPjZQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: actions: fix SPDX comment style in header
To: Mayur Kumar <kmayur809@gmail.com>
Cc: afaerber@suse.de, mani@kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37583-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D02CE5E4D68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 11, 2026 at 8:30=E2=80=AFPM Mayur Kumar <kmayur809@gmail.com> w=
rote:

> Header files should use the C-style '/*' block comment for SPDX
> license identifiers. Correct the style in pinctrl-owl.h
> to satisfy checkpatch requirements.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Patch applied!

Yours,
Linus Walleij

