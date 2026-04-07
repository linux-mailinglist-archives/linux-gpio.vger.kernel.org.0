Return-Path: <linux-gpio+bounces-34750-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDotDu+s1GnNwQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34750-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:06:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D11FC3AAA2C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 114E2300CC04
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 07:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ACE3921C8;
	Tue,  7 Apr 2026 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXyWOlKT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE50338F638
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545403; cv=none; b=YaxzfJdbIPNuZR/e/bBpOjIthq0ziuPJZshaFfHn0Ms7hZ/Gg2z3DzflNCrqqIme7X7/ijjcavmBUYZ5iKYw5Uq9KjqjS02Qww21HBroq2uRPjTZY49I0XwD/Ov7cHru7RC/XGpMDnET4OF8hAZ+WthJaxCZcFaiINBD8GsOQBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545403; c=relaxed/simple;
	bh=hdGsIdGCujQd+qCvIkSwIUYZUKZLbuNKzjiPq/1FM1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyXndcVDjZv25Uu/Tu+tHvGxEQqFSiUWtcXXPehCvyk0Z7MF19FP/2yva2C3jpoDII18hXPgiZTlin9LIQ+ftxTqt0b/XGsDolU2FaDnVbYveHYj3S2C6jlXBGg0E/PCEL6OwDYZlm85uZWnihVGWLHtpnsTZqlTcSQW64jdcSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXyWOlKT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C98AC2BCB5
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545403;
	bh=hdGsIdGCujQd+qCvIkSwIUYZUKZLbuNKzjiPq/1FM1s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iXyWOlKToI/eCfrQD7qKUtIfeRsgMuPvO1ZqRzMqAmvisW1gad0ssF48BSQL+Y59E
	 4FwgHTXtY+VLclBwrG2ovQTiLmtR3/WakMj/aNthvUXF4KaAOI0RZNKtoZC41/gCd4
	 geCpcSlLZlm+vOwdWZUoABvS8RdWBz492oRZDOMxUzB2tZN67blIZBtPnF1tgCPDtY
	 D/dBLzToGzH4sTClhcuz3NzGx6795ZpWD+oQru3+ym5VHwdVqSpY6pn/NfCyany3W9
	 rPnZphnIwpqNuyYYcodTMZ8MGJf+OC7KOA66awoT2yMnsq2Xeg9pqnBI7Bu1qnKJML
	 zeKtjAX2h9YNQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79ab3e26cceso40404097b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 00:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHZKvhGd8yjDcwqBD9eQXtstnLCh3C8ATIaxxZVCPK8eU+5YLsxI2ACs1eIf5WnALyW02kWYZ3UJdF@vger.kernel.org
X-Gm-Message-State: AOJu0YwVtxwtzvzaoUvotLBOFHOAKkDhLAm4l2pufQUnbVhAqVBQVH1G
	ngqsO9tMBhOcCcQwHTUtr/DN0HoqNY94RhKVhFZdTlfwr5BzIHRb6M6nBns9fKcBBC4W1/J32WU
	AwgtBEwjerEHH1uBVbUK+U769vpDAhzY=
X-Received: by 2002:a05:690c:f14:b0:79a:d2ba:3c24 with SMTP id
 00721157ae682-7a4d5f5a3a8mr161901347b3.41.1775545403027; Tue, 07 Apr 2026
 00:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331200658.1306-1-mailingradian@gmail.com> <20260331200658.1306-5-mailingradian@gmail.com>
In-Reply-To: <20260331200658.1306-5-mailingradian@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:03:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLk5VzmH93KcfY_JQf7qidoroiuDyQyD4GT73uq7rAU4kQ@mail.gmail.com>
X-Gm-Features: AQROBzBKdohQM7PK3scjzV3O3ZZeGxVk4mW9zkJSPWiCUIGziZg7yTKCeJqHL38
Message-ID: <CAD++jLk5VzmH93KcfY_JQf7qidoroiuDyQyD4GT73uq7rAU4kQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sdm670: add lpi pinctrl
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34750-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D11FC3AAA2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 10:06=E2=80=AFPM Richard Acayan <mailingradian@gmai=
l.com> wrote:

> The Snapdragon 670 has a separate TLMM for audio pins. Add the device
> node for it.
>
> Also add reserved GPIOs for the Pixel 3a, which blocks access to the
> sensor GPIOs.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

