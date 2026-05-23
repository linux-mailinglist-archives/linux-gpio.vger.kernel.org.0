Return-Path: <linux-gpio+bounces-37403-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDLlIgJyEWq5mAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37403-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:23:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9285BE327
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EDB3301992F
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4D9346A18;
	Sat, 23 May 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsJCYesh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2F53859D2
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779528176; cv=none; b=mStKOAQ3NkWKss28fcH9BWS1b5RhnnXpgPxvzMdetyvjkg1uYmHaAJVvLjjVgBU/A58yy8AzUHSlkqnGJB+Psi4wS3pC+FiatC7eC+AVY1zrB/ui7Rs5bR683D4HQSTznntcO+xsKowI/EEpvDqJIEOrz4vbvjiRTCQop5PXE3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779528176; c=relaxed/simple;
	bh=rHPrvzMzPdhFTtb3ErSSuGGOXx/xIWfmwULlE32hmLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwfGyVw+QirYWKyeh1GkszsERdPRTCC4OMtb0QthYbgkw7LGz36wyBS/WCpc5Z61+s6F9D71AVespqwpzOOH2Sji2i1rx7H6tsqenCpjySgTL6zu0i9zLbySkDbkI2MrwHURj85NzgpjqNrZr2CTbIskWMw96Cs15u+J7wZbxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QsJCYesh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139801F000E9
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779528175;
	bh=rHPrvzMzPdhFTtb3ErSSuGGOXx/xIWfmwULlE32hmLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QsJCYeshsT54sc8eoUQVcykobsFp2njIy+PZAQBWog1hmI18niqASDacOdXk/Jbp5
	 gGyuJQjT/yUtlM5gpTNSw/UUpieuYZrGuHOX5koI4tKO55kCAnP8zgNg2pUaP5giZk
	 SLW+DL2IhLGLVa9w4rGZHCsvnqm+b6W4WL718Kx9CmoYVatYEDT7xeYraJjruqTeeO
	 VMMsF61C81Fhq8fXadk3wYy3lwcIm4Xyqlvj4gYTQwI2bGrmOD1xZeuBABLiod6VS5
	 QYJFxjm3csVEF/X6+ycWuBm8kQuZHdHvH1Iii22wDRzak50Sf1Ai2Sb2fzQK5NAZYF
	 35ptt63kpN7ew==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so8403911e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 02:22:55 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy2RVAzYMkyJhTBrm2yo/QNXWo1a8kNeckTlTfAy8YFS1boV76b
	QHdVfSvzSZAYb6Eqlo7kdZZc12oUrIJICBooqmP6xYagcRVv4e0F9fywi00CHqcc0B5seGyp1At
	pIuEFbHvfi7ctuxlN3TeBN5kqU4QaAP4=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:f6fd:f201 with SMTP id
 2adb3069b0e04-5aa3235ec9emr2112367e87.15.1779528173908; Sat, 23 May 2026
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513231154.2703292-1-jm@ti.com>
In-Reply-To: <20260513231154.2703292-1-jm@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:22:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLn83aR_FiRDH+F_vhtMrDt+nrRjpXV+0c5a8=6_icM+5Q@mail.gmail.com>
X-Gm-Features: AVHnY4Jw0sIYz_yHxYaOe8OFvTAk1lAY3w7gTFjgsb3ObA-s_o-fdC4svHKScik
Message-ID: <CAD++jLn83aR_FiRDH+F_vhtMrDt+nrRjpXV+0c5a8=6_icM+5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mcp23s08: Fix probe issues
To: Judith Mendez <jm@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37403-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0B9285BE327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 1:12=E2=80=AFAM Judith Mendez <jm@ti.com> wrote:

> MCP23S18 driver probe failures on AM62L3 BeagleBadge[0].
>
> Fix MCP23S18 probe failures found with BeagleBadge which has a MCP23S18
> on board chip. Fixes are made up of initializing chip data before regmap
> init, and using device_property_read_u8 to match binding spec. First fix
> prevents kernel oops and second fix prevents MCP chip probe failure.
>
> [0] https://github.com/beagleboard/BeagleBadge

Patches applied for fixes!

Thanks for digging in and solving this.

Yours,
Linus Walleij

