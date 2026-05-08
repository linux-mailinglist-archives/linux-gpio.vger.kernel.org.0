Return-Path: <linux-gpio+bounces-36477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cYoHO0su/mmvngAAu9opvQ
	(envelope-from <linux-gpio+bounces-36477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 20:41:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD24FAB1B
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 20:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8B8F303F7D8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 18:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB32A3E3C4B;
	Fri,  8 May 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/a/U/zy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BD3DA5CF
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265637; cv=none; b=YFy/dxnPL8Yl3y30htbNsnGNVaLRNnJKTtkcmATIZcUqWRcc5N8Ho7gmsV433S9cwvpXOsQBvlLle1lBbsTy7MwBj0XZU7ESkYImq2z2s3FQVQfpfVek+1DKQeyx9MkeJnzwNS2fsDnoZRGtEsOfYl4eANe9CVaceyRgw10GEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265637; c=relaxed/simple;
	bh=ZpEY0I24w2UWe9UlEcvuM6WpiyJkrfGGvZVUiOMyjmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhUjZ03ZRoJZXY0gu0/oF2w7myIxca+v2VBnEZLqafWPI8oQizn8sNoQrO8oAE5PaPRp67W5r6kiVOCIaVg46Jbni1FGMD2kwC7R0o5Y207BT4YnUrX4Q/y2JQD8ZrivKdlWD7ckWXxLGo2Nle7ceH0oq8vFMPrnHWtGSqkuv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/a/U/zy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D20BC2BCF5
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778265637;
	bh=ZpEY0I24w2UWe9UlEcvuM6WpiyJkrfGGvZVUiOMyjmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f/a/U/zy9BdRinw+Yzbg+65eXe74uiFCvqoZpTud7F81EvgtHEroNYSfJ+oGcUYWc
	 2mwREcSxT7C9iyieD2xUDKuIxfl4/lQ6MRNK3zCTgJ8nIk8ldJlm4VqdiE/OSE0qTz
	 XbfqKNccSsItzhFJ8OQlL4zze3BvQZoq7FiPW9qTFTWr3gHrejdNsEDjC0qTlma9zt
	 fzEIEvpDnFjDy/67FoGQF+5MzTwU6h26Nyd5FwGZ1+R4GbNw9Sg3snF0MkSVPBk4tr
	 7NmBZxR/w39TZfnqzR0kE61GaTyJR+BQS6MgB8Bgb0IvT/MNFzJm9QR19D4SSqT0hu
	 uTAVWs/80jw9Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso2359802e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 11:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qCbiWl7S96J6/xmftDEJNjdhx1uzM1ktriZBdoOBLq7yn7cdC1CyKsJ9WiYzdREkLJBjyHXvS032d@vger.kernel.org
X-Gm-Message-State: AOJu0YwukeWbapp66T6yhdQRGWmryb7cKDlY+jKu95PKEiJfmKIfG/N0
	0zFx1BXO6Pgld1rU0BjaPjKWrxiievbUyYbFER1Dek0PMcfKV0L8Jpq0KK9srviPOIrwTnOLj2V
	T9s3IFCWyV0o1SPkMZSkDGmplPl7hw3E=
X-Received: by 2002:ac2:4c48:0:b0:5a8:6e82:6840 with SMTP id
 2adb3069b0e04-5a887cde953mr6771548e87.20.1778265635627; Fri, 08 May 2026
 11:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afzlsRkyKQzuUcgL@ashevche-desk.local> <20260508061729.9530-1-mscardovi95@gmail.com>
 <20260508061729.9530-2-mscardovi95@gmail.com>
In-Reply-To: <20260508061729.9530-2-mscardovi95@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 8 May 2026 20:40:23 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i+2C2FNHGnXFUTkrovcckiesrowggjmwtCkP53nbTCGQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lv61LjMQHJXiLQsQ5q55zhXaEliW8katNGvwp01VXUxd-fCCxTTaynOb0
Message-ID: <CAJZ5v0i+2C2FNHGnXFUTkrovcckiesrowggjmwtCkP53nbTCGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] ACPI: Move DEFINE_FREE(acpi_free) to global header
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: andriy.shevchenko@intel.com, linux-acpi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mathias.nyman@intel.com, mika.westerberg@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 55FD24FAB1B
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-36477-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 8:18=E2=80=AFAM Marco Scardovi <mscardovi95@gmail.co=
m> wrote:
>
> Introduce DEFINE_FREE(acpi_free) in include/linux/acpi.h to provide
> a standard way to perform automated memory deallocation for ACPI
> objects. This enables the use of the __free(acpi_free) attribute
> wherever ACPI_FREE() is required.

This goes a bit overboard because the objects needing ACPI_FREE() for
freeing are most of the time allocated in a way that precludes using
__free().

Note that you are expected to initialize the pointer at declaration
time when using __free() and that cannot be done with objects
allocated by ACPICA code in many cases.

> Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
> ---
>  include/linux/acpi.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 67effb91fa98..f58e704ee850 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -234,6 +234,8 @@ static inline struct acpi_table_header *acpi_get_tabl=
e_pointer(char *signature,
>  }
>  DEFINE_FREE(acpi_put_table, struct acpi_table_header *, if (!IS_ERR_OR_N=
ULL(_T)) acpi_put_table(_T))
>
> +DEFINE_FREE(acpi_free, void *, if (_T) ACPI_FREE(_T))
> +
>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
>  int __init_or_acpilib acpi_table_parse_entries(char *id,
>                 unsigned long table_size, int entry_id,
> --
> 2.54.0
>
>

