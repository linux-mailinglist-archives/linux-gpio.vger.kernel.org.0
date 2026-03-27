Return-Path: <linux-gpio+bounces-34237-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDQ3KgJDxmlRIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34237-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:42:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11E341283
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42EF7304B8DD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 08:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FAD3D0924;
	Fri, 27 Mar 2026 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz/iVm7N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86CB3BED2D
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600892; cv=none; b=Pf5lZKdQGZ0uFqsbW4gifNEvulFvqWo/Mi2GEbVTXfPqO+/iIM4tszBKnNsxahw0JZ/DJFZ6+va6akuZFv9QDYNbshravmO9HcM1ZACYhyh5MUY9JVxJQdj71+f51LqtMH+I3Bgvv3EJL7dzIGsAoJbJRdFCEgh6VxVS4XKQRVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600892; c=relaxed/simple;
	bh=VrhiF+bEO/vBGKES6NJGCAn1yPm6UndLlTthhO+gBqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtUPo9UjtgWVbRp4MRFYcXEf+kg+9FKAoVhzr2/E9Vs5qzHkpVDm8tI/43UzBSi5K6t6/GKJhwoNMsCgjQ71dR/JRBE7UWtoEq8UYF0EtWCHZT1FaL5vdRHTG02WyAP2qnqacSN7VtcJBavxQ3KrcKZYhzYq2Td7pZzQYvtcAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz/iVm7N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FD4C2BC9E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774600892;
	bh=VrhiF+bEO/vBGKES6NJGCAn1yPm6UndLlTthhO+gBqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gz/iVm7NE9BQ3vv6M6/o7XrMvAAxuSLYEIqc0shEzKJP534N2kyCy6va2FqKXqbZ3
	 vSgY9Jb1xT5vO2G4vuAnos/f6OjtXJyv+mhs9GHdVXuqhRsBDDFa70sNsu7Y1B+esF
	 cSqxn6vU4n2GbAQcfO5RYLvrDNShjlmqBGzQeNdyDYWDdeuK9HWk7g6dnLX2TItc8a
	 yVr6Ud1ZhCe55zah7sjXPHzVTXoS/rfmJvexoVGItKvmVyLnSdociP5J56keriDWUm
	 HW6UAdVqOM/tk8NLgaC0DoEKQNI+iLdurWlIHVZ6Mz1Xmo4okv/UkCWIKq6yIj6qfv
	 bbWZ0UfOXaGgQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a74765703so17399117b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 01:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHl9NdfhQbFPnqEoeU3QYNdeAwFOBGZv7+ha8YfoHXKL9RRWivWbwsLr0YgTS3FTG+noGixorp+NLu@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLU/MgLvaD63O8k+vJVs60ap7piMIQ5yHxAcNm84hv4Qnul77
	g3g4SXa0cprJ6AmoLyyz6J3kpnxTWgWih39k9VaegrbtHyYDWtZnFVqyCk/pZ8M8j/Rb17IuSyD
	9gKk2C+Uk2b1sxKqgrD5rrGD4FatGyCI=
X-Received: by 2002:a05:690c:6d84:b0:79a:c50f:d5a6 with SMTP id
 00721157ae682-79bddcb96b6mr12583937b3.9.1774600891733; Fri, 27 Mar 2026
 01:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327050616.3816318-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20260327050616.3816318-1-Basavaraj.Natikar@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 09:41:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=CvRwR+yV6312jwoERw_XwB-xFhM165AZ1P9-bcDmWPw@mail.gmail.com>
X-Gm-Features: AQROBzAx1s3AN01Fntxhp677RThDxWczDdofki00iWVU3kM8p2CoEoYwCDD3n58
Message-ID: <CAD++jL=CvRwR+yV6312jwoERw_XwB-xFhM165AZ1P9-bcDmWPw@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: amd: Support new ACPI ID AMDI0033
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-34237-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 0B11E341283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 6:06=E2=80=AFAM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Add AMDI0033 to the AMD GPIO ACPI match table.
> This lets the driver bind on new AMD platforms that expose this HID.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Patch is simple so applied!

Yours,
Linus Walleij

