Return-Path: <linux-gpio+bounces-31363-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IxYOwo/gWl6FAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31363-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:19:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A46DD2E1A
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DA163018764
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 00:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EAD175D53;
	Tue,  3 Feb 2026 00:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttD5xsaJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984817A2FA
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077939; cv=none; b=KDWqxu5fYRvV67XyjQKDeOUeaGXmso5zxf+WYyIZ9W2c5lub8yinDlGnZJd1lGirm+2TOVKtPzYDPJwr4TZ+gj8kM+H4o5g07S4gkxLQ55GkMtHSSvrxwHlf7o0EWeZhoHPf7OWmDGNLJXVaoaceG/E3pulXAHQR0bdm1zQdrJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077939; c=relaxed/simple;
	bh=kvFBZrL6mjnoA0d4J5XigmhYX+FRf8/EkWVJ6Im6XWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMd3+zJaPb1H1uD5wi6yA/hKAyBRfvNGO+RiRs7lWxJwFnZKdo1AFdUXXFVBWwwvPFhOm3Xui5/Onv5slB5TaWiywyUHqIEyT+UY5Y9Mqhf5H72MdGVw/TojFDhJ1OkVmu873lcpJrrFI6IfQssuj9nv8zqQPARlQPKc8N3/pJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttD5xsaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2403FC2BCAF
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077939;
	bh=kvFBZrL6mjnoA0d4J5XigmhYX+FRf8/EkWVJ6Im6XWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ttD5xsaJs0J3WzIH+zZ+7i8C+Hd2hXp6KOCVgBZdLRwG/OWsLetP60ZwFIJ3O8hJZ
	 XBhOZJadsTWDw36aX8PuAQsM7qBrMz5l/WYAIxw3rGw4c0jE96YEXrmEPWUNmmIHaM
	 nDxJVLqZ4FFo8wv2tvNBY0mCFzXuoPZTMn8LzzgxOCykKbQL//2ZWQc861YOS/Rs/s
	 llxzo6q/eIbgxBXuJXtkDVm/OGKlfaIgWHHSJoyT3DTy/7yz7UuYTN4bCWZX9ypq+x
	 PR4VhAPdd3+O6DeH+1FCFibS6wazeSCvKDCJNWmtaG1XSPsxfPjzc0DMLnNhFpL2ix
	 5MADNKoBxsdzg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649d4c77a32so55452d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhB2xGc7byIgpqO5YOcHdm9NsYXeR/FEmt/CPdBwrWrAhk2zF5qApcz5Kfm/GxQB91yA8DQxf7lcvb@vger.kernel.org
X-Gm-Message-State: AOJu0YyfRJhz8EKdFRAThffjFvTiXTGQGYmCPj5qE4tuhBX2VCvmAzZ8
	k2rsxGkew51iaNp22zR4wT6GyALQu4//eIph38NAvbYYrcorDQ0cyROcA6Pz3G/ILdTfBakAO8c
	XzJpLkMdz/GxQ+tSFpri2PBa138JwoVE=
X-Received: by 2002:a05:690e:138f:b0:649:b31e:8f5b with SMTP id
 956f58d0204a3-649b31e912cmr7549452d50.4.1770077938461; Mon, 02 Feb 2026
 16:18:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:18:47 +0100
X-Gmail-Original-Message-ID: <CAD++jL=iqUPuVAmytT1kmMgV3cBxdvjMTAkg7PqaiafoRhguVQ@mail.gmail.com>
X-Gm-Features: AZwV_QimfTlckJYCT2zHhZcI3wnDbHT5acmPKReswmLekZo2WTj8N-fEd6bdc4w
Message-ID: <CAD++jL=iqUPuVAmytT1kmMgV3cBxdvjMTAkg7PqaiafoRhguVQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: core: managed resource handling cleanup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Philipp Stanner <phasta@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31363-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9A46DD2E1A
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> I have stumbled over low-level APIs used for managed API implementations.
> Here is a clean up along with a drop of some duplicate messages.
>
> Andy Shevchenko (3):
>   pinctrl: core: Remove unused devm_pinctrl_unregister()
>   pinctrl: core: Simplify devm_pinctrl_*()
>   pinctrl: core: Remove duplicate error messages

Sweet, patches applied!

Yours,
Linus Walleij

