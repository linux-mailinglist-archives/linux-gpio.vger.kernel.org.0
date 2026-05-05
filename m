Return-Path: <linux-gpio+bounces-36115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJMxF5y2+WmNBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:21:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 022664C9819
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0782F300752E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD27E30EF91;
	Tue,  5 May 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnysTQju"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC603093DF
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972887; cv=none; b=E8IfK1kSqG9clJakiELsnSviyyfohmcam9yGK2TpmVA6Qr7UmEA1TZzsgfH8ar8EJQCDzAxissVhhiDbeyDgDa0ph1etQ/vHw+AX4r6DQuMFlB9GHCDMqrzNtxRhnGW7pLn7c+0SCqJGhr1sFDN+sOsYMH9EM+0SrZLQa+iOp3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972887; c=relaxed/simple;
	bh=fPgYO/h0P6jBglEJ/FzHxwNEaZtQJbUM8Z0qBsYUCYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dakfyJfVjBFbm6SmGnNcswXmB9C7nkEQaDRCnj5YZ6FnWvZiUIfgWlVo0Oh0Ly0xE5QfYkVBX+M+cYy/39jEoLoNDF5xeLEtKioH46EbZrw4UNiaruglMP2KzxrqmoWOnY3tA/qnegrPqqGeG16p43V+gEM3sfAkNa0q146NgYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnysTQju; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C70C4AF09
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777972887;
	bh=fPgYO/h0P6jBglEJ/FzHxwNEaZtQJbUM8Z0qBsYUCYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LnysTQjuZHQyFzRJFA0j8SG/R5gdS2CRSC3IY8xU6QwuPZNP5oZKQAqNMJmItNh29
	 1GJkhuXoRY/LyGyOgWwCkvnNtc/kSQ1h+PICY21XnG66/2utmiopUCNkojYZFirxBR
	 2cwOe7IL3YB1iroUlVrix/n4dXiQHT4iPhOfptAgYxa0VUuwGp7tU87NhK7C4guQ60
	 vDgMJZg0A3/OKf+7lyhGi3WBa/yLWyhR7kQM4H1Dx5D6asQnJ3skbCzdHCVGKp8+4n
	 sXUB+D6gBGIRDxvN7HLczCTh7RG5rMqM6VN0pAi51h2q/GRL7ss+uc66QXr3lKv+MJ
	 w5ef2BFtwxyXQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso22325221fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9tQsVaaEJGTix/w1QgqsmjT+TLXsbs74olEed8tNhSHRmtbMdi72aVhesY9bKZYA3yToPotfZS5Sm3@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLOPKuURVlIkuB630+mt5wifwxugjW7AixI/+Msso2O+ebOMR
	tyJng3XBbNh2Vp70BlwOc7E6JG11ORbVaemGaxFb2GDgjGaHTx3KJuypJh5vFb7lTS26/PnLwEu
	1HhVdrj+AwPtv7uV3v61P8YKy0IvWab4=
X-Received: by 2002:a2e:360a:0:b0:393:903c:225c with SMTP id
 38308e7fff4ca-393903c23aamr29489301fa.9.1777972886000; Tue, 05 May 2026
 02:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com> <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
In-Reply-To: <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:21:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
X-Gm-Features: AVHnY4JqgJJ_-DwBFHnVz-Fim1cfJYHsgLM7L9yfuud9N3SuTcVr04357vZ1UsE
Message-ID: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 022664C9819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36115-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]

Hi Xianwei,

thanks for your patch!

On Tue, Apr 28, 2026 at 10:22=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Update dt-binding document for pinctrl of Amlogic A9.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Please update the commit message with the information the DT
maintainers need to determine that a new compatible is needed,
i.e. "registers are allocated differently" or "new hardware registers
exist" etc.

Yours,
Linus Walleij

