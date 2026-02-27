Return-Path: <linux-gpio+bounces-32270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Kb0LIJioWnIsQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:23:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D26E1B53DA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F25F13011A5C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A48F3A782B;
	Fri, 27 Feb 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR6A1fIm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6C372B52
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184187; cv=none; b=UJPjFGb0BtVWYtXlual77nZPT3aXwqLBAC3+S16dZO70eu6gBpq3CydKJHBAKamTM2wHggMii60+HYvIBvKcs4g5PwRacJnhEvtvfyBFOkfZ4nztEZopmriY+N9oUSgQPcjVeSfBfZcmTF1OKA7WVlUVJ9DnBAlY+9cO4aDvdmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184187; c=relaxed/simple;
	bh=bzZmZo8Gs9aXMPQZrUaoUlWMHebUk2KOrySZaq2hYVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYRfHAr+MNbqlyAm67xkrmpg1HRZpawPIG5sTkYvHgGn8dtLo6DEyp+X8SPjRezaeVFkYNVE8LzPGEVvnTiU4ldU5vfS+mrViFufCMKVudMqOmp6TQV9jMgsM78XDochBas6lmuwTWfdZgCwojVRPkBq+XDpaLy/aAH1b3xQIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR6A1fIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F94C19425
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772184186;
	bh=bzZmZo8Gs9aXMPQZrUaoUlWMHebUk2KOrySZaq2hYVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NR6A1fImsgZo2g+0F/+HKWlJFqu7AEJ7jPZ3qi1DSr/hP2aA3PrmjELXSKMJnKulu
	 dacC6Lq2chua6ttdZMam3Y0DYML445lgylRNp91OYm5yGRI0OqlCY9VDDkkpmTWDND
	 qGc9u13tfVLoMSHeSWgM6FSC9/bnvLYvS7CIkx0+mwulMWIgs5PYKrR2D1V5TalrIW
	 flEqvTA71r2xya2PIXzJkvAxXLsj+pBOGTpFHJQVTviQsW8arqG9zsSkSXGDpVJ7Ot
	 Qzk3Q+GA9x+FKSuq+B4BGMlwBhaFLYAy+k2lWMy0dTlXyyXaSU/TQKhjDVisIRYCer
	 ZYDoLJ7WXko2g==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79628fb5c05so14029077b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 01:23:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/n9YH5u5KStPrLUvZ12yvz8sOBa9v0hal6koBnO52X2GqnS3fXcCcK6+AcO5IlSFUzKRDkL46Bj6F@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8AB8gLSHPv65xMZ1ZRknHddxKFHlaCZeJYcKuodzLcOb6rU9
	EnUaUsg0CZgv8Z2+WVbLw3KiBgqnf5RHsS0+D4nopLFTeaUC8wzLv5eUQ2bcKF1G2X2bprTc/v0
	aJSF4vcM/v+VKb5LuRzMdGUfdrQApVMk=
X-Received: by 2002:a05:690c:6d03:b0:794:f8c1:69c5 with SMTP id
 00721157ae682-798855091b6mr20143507b3.28.1772184186070; Fri, 27 Feb 2026
 01:23:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org>
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 10:22:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLmgi1iK6RycwVS-GZFW9591wmcccQSMOFmTsxKY1RuQVQ@mail.gmail.com>
X-Gm-Features: AaiRm53Dm4P8e-GzFuWOPiZ-86ZMRP5wt5fyxINVDq9oAJYPTu5OfQ_r7QiM6rw
Message-ID: <CAD++jLmgi1iK6RycwVS-GZFW9591wmcccQSMOFmTsxKY1RuQVQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] gpio: Refactor and add selftest
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32270-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6D26E1B53DA
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 7:17=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:

> The series is separated from v3 to lessen the burden on the subsequent
> revocable work per suggestion in
> https://lore.kernel.org/all/CAMRc=3DMfQumD1ULx7yU4W2sx=3D35wyQf7-v4tSf44O=
qEu3JDBUAg@mail.gmail.com/.

No matter if revocable goes anywhere or not, this is excellent
maintenance work, thanks Tzung-Bi!

Yours,
Linus Walleij

