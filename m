Return-Path: <linux-gpio+bounces-37593-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MkBJK8cF2rw5AcAu9opvQ
	(envelope-from <linux-gpio+bounces-37593-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 18:32:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB4E5E7CDD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 18:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 921FB302B38E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 16:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0DF42E01F;
	Wed, 27 May 2026 16:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPQGzuWn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83F742B72C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899203; cv=none; b=CL+RdJlXOOMzNMI1GTQWKfaahEaO3EKXJLN1NJ5tTNwkrjxd7yZDfSoZQkIPDCAABVgfe3xVE53euZBEU+nPTPH35QuT3MnPvtAegTf5M3ZiloQVO6guwQ7YdOP58pL2j7FVrTTmNDVBgbxOqgy2pJBlzdbOQILCY6U45uIPk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899203; c=relaxed/simple;
	bh=8BV3+khZegmizDJn1lokr/0ihOHmzM4T2I1EjFqoDR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8x0H6RaunUIKzS9RtwP8TPVzB3HshsLq8crHbhKY2iOTXi1biwIErxzEc7JbzIpc6VLwTALEM7AHiIAmIIUj7HOXrxlTWUvdvEPAAM9x1/zfPfOj+pXIWQ5/sPWxzqR7cypnaPfV+xwC+u2NoxX+9sGpCLzRfVIYAs+yTyGBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPQGzuWn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6818B1F00A3E
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899200;
	bh=8BV3+khZegmizDJn1lokr/0ihOHmzM4T2I1EjFqoDR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SPQGzuWng1XUqH4CdCnby9ZPZT0k5igngAvULTpHJgh16mV1Ob0T4Ud8Q+fBAdBbn
	 XXcM0nd7HERu2v7HXL8buIyKieWIg7HbZLckpIuzCjznDyLz5Xww9JzgYV4zOF5MUT
	 kqZmDjrPuJ3xfdp9huqWd1M0FX5Nm6Pa+4xz5Ph2fS+45RHbSSiXhG47aUQaiDZkw4
	 n2IVR/tgnnTBLNZSlQYNKEUZZXdsiMi+w6tThzEtvK1DyzByrSSV41tYJOY1LjO1fh
	 HOQ4YO3myfVF8RA/egMUmfthCKO/ALX50v4n6UdQ2buYHqSghqLO/pp55RXLKapxBd
	 6Ryfp6qFzpZeg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a884815606so13017962e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:26:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8xoXNIByJ9xKBY3pDjFvm6HbS1YNM+bAdTDK8xRaxUpGCx1BHoqV9KsdEbQD2nvp++tKA9cPWpinR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+7l5GVXzWRSt2DJnpLAi8V2gtAA+aVcntjXa3WQwuI+xmvSr
	CyUfz/zAgfkBWgwHbf/c67qkZ9vZV1Q0WOGo3nArWaCyS/faBz2XQBoYOledn4dvg/v7ZzOd3Pn
	n2S67tqOxenBUVkDCkGFrC3bDBAv6E6w=
X-Received: by 2002:a05:6512:3ba4:b0:5a7:42e2:db4 with SMTP id
 2adb3069b0e04-5aa323a16eemr7894312e87.15.1779899199187; Wed, 27 May 2026
 09:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522141149.1425711-1-zstaseg@gmail.com>
In-Reply-To: <20260522141149.1425711-1-zstaseg@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 18:26:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRRjna7MSQ3UYKW+Buq6_yYRR-_wrmd0Ye-FNmoOwbLQ@mail.gmail.com>
X-Gm-Features: AVHnY4I2h5cRGGGZTMq4EXlNnEHAWl2FcAS1NNMEEAQsvczyEUSeNfIJyyteYCA
Message-ID: <CAD++jLmRRjna7MSQ3UYKW+Buq6_yYRR-_wrmd0Ye-FNmoOwbLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm6115: Add egpio support
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37593-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DFB4E5E7CDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 4:12=E2=80=AFPM Stanislav Zaikin <zstaseg@gmail.com=
> wrote:

> This mirrors the egpio support added to sc7280/sm8450/sm8250/etc. This ch=
ange
> is necessary for GPIOs 98-112 (15 GPIOs) to be used as normal GPIOs.
>
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>

Patch applied!

Yours,
Linus Walleij

