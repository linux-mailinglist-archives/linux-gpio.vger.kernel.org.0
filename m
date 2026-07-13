Return-Path: <linux-gpio+bounces-39966-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YvRbGgq9VGqDqQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39966-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 12:25:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C60749C39
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 12:25:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39966-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39966-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3796300F79A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51333E7BA9;
	Mon, 13 Jul 2026 10:24:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC83E7BB5
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 10:24:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938278; cv=none; b=f6hRKd5XzJfB9uNthKUHFIfp6OpQ/A6WoaZCbyaEghS2Ru298F2Gh+jM4CeN7VoJ2GDwEVWwWiEwJFLyipdw7xFyC6NbceME54KwqYlQDTLrM3p8Izh8lEffRv6zmLOmFOgZNO7sExtxTqwAYM8cqQO/8jWHMVBkPIDQ54Xk3nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938278; c=relaxed/simple;
	bh=gnOONJI/FttYdj/hlauLNnplmzplZ3jAon5ohLlODbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOwBT8B+RGYwDieR4uuEivEerp8NGn5bPhtzFWR5pyE7biuJgVflZSqPjgIRJgOjVCS3+pBxcaQ5HOGnC9Fojsfg2jcQSh0rsUEKKhPqTMLNzUnDXIAQzJFR3/dQVzv1Zn2TtHldMyWKKOfyVrQbfQGSA3VIsXuMQLiTCmieX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so4831380a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 03:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938275; x=1784543075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tbIGIghWWKNfDdw1F8tz0OtxhskaJuOiI918laGeFvQ=;
        b=huEKst9s3ZJHLzqmGmCTjZujAnyy0zooH4cjvNS3pJhMweUtif2Xrirb3fULn1PT7Q
         o9ob+zk1ox1rS7tlPbIxjhMsJC22f6RWoKf/8jWWjkO+q+OmCzZVNTZTKlRYYUwkON7M
         PtG4eUpM9rrPRf6hFfmIMxC7pLQFh548XqK4rRP6DEXbi/fOMyoSuiqYUVkbiN+8QcIc
         zdUD8OJEsUIZ9BQyc+EJFtvqpfmTnoEPHu+SNKrh10ryZ9HeHWtXBn9q2HaGF9cIlVwV
         EX6CpcbHQYoyBHPOnefF6LbBdkeAUa0dqb974+qa7psue9zIx4fhsT5wOw8Q464SYmhc
         HhNA==
X-Forwarded-Encrypted: i=1; AHgh+RqlmSAEiByzQO5sQ313jycOg6SjruwblC4gPlO9Pejxj6B4XmroNN5ipSeKkVbbpkF8+eHX7THiYG1e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8osJTNdxT9/Wk0oLomtKyQGiOUu3irE4xR1Ht0AOEpTiVeAei
	usZdhkNO+RF0PAYBRSDVfnvLOr//t6RcOFRag+WoQZtwnvL1V5xe8Qr7WyRMOXhOgDM=
X-Gm-Gg: AfdE7cloZWGigxa/TcUu3ivAu29FJ3eKF9/dsAsqZBEPPk9Chrjh8sJHsYLjVhmUtwk
	xyPJS+qpRfZ1ZuRV2ZwRWnzlDN9ptEDWUw2Rf6nM4YuqsnUJJPlknacF9DIbhZbAH8eTQZCszTP
	WxgDa4XIDBmO9A1+6c98yZFOE7i9BPckZe8JGcGMb79GZh1bAQN1GxIqg5ZF26umwhV7JzPR68w
	GRzKy6dkOVGmRUQb8tnNXdcQdwCckwXWAoQ82LIwtA7rnNvJ/XlrUF0fSYJqaqAzD/bNnwBv4a0
	6S91HgjZlp2SVQ2FMIBFr8DwEXokcQkTK1Gvqo6NFpf7OQ8Lgkqr8THl4pB0gF8jV/rumHhtW3D
	Xaw2hD62UydJfOpjZehURW5OtE2RgKhR9Td65LYYJneW7oC+hB5ASK9FQXhxfIQ0y43xxU7fMz7
	o5jbCuCLI3s2YKCijLvzjH3rgb6Y+Q200IUz/3voYWMLuB4raBIw==
X-Received: by 2002:a05:6402:1473:b0:698:585c:f07b with SMTP id 4fb4d7f45d1cf-69c5f0c7993mr3589409a12.3.1783938274498;
        Mon, 13 Jul 2026 03:24:34 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd87d6sm14798854a12.6.2026.07.13.03.24.33
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:24:33 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so4831338a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 03:24:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjS8n4G6h08Ac5KQlX31KgB5Rq7DIk07YcbClTHXduR71dlBF0ZHUyFpgOFfe8OQceZVq7EwtPCebx@vger.kernel.org
X-Received: by 2002:a05:6402:a513:10b0:69c:72e2:5b5 with SMTP id
 4fb4d7f45d1cf-69c72e2091dmr2025764a12.19.1783938273267; Mon, 13 Jul 2026
 03:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com> <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
In-Reply-To: <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 12:24:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXD0EyaimogRnvbWg1HC91kE1EdEZtV7ct8s-JY9ho52w@mail.gmail.com>
X-Gm-Features: AUfX_mw0RXrcJVfmTIefgb2UHhGLLjrZR9uzD_wnzzRTLlX3FQIauo0umSvX6WE
Message-ID: <CAMuHMdXD0EyaimogRnvbWg1HC91kE1EdEZtV7ct8s-JY9ho52w@mail.gmail.com>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the
 buffer init
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39966-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86C60749C39

Hi Bartosz,

On Mon, 13 Jul 2026 at 11:46, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 13 Jul 2026 11:20:02 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Sun, 12 Jul 2026 at 11:32, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> >> To avoid more false positive reports of "leaking memory" when
> >> fops_buf_size_set() returns an error.
> >
> > But who is freeing priv->blob.data when fops_buf_size_set() succeeds?
>
> In case I was too eager picking it up, let me drop it from my tree before I
> pushed it out and wait for Wolfram's response.

Sorry for being unclear: the issue is pre-existing.
I don't object to this patch.

I don't see how "people" would come up with these bug reports,
but probably I am not smart enough to understand the logic of the AI ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

