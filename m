Return-Path: <linux-gpio+bounces-11371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19399F5EB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 20:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BAD31C2415D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 18:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5AF2036ED;
	Tue, 15 Oct 2024 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0uYgUDFo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242DE2036E5
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729017832; cv=none; b=Y6Gqf6Pqd3u6NssY2C4hVtMZV4xlmmX8eU2zm0UML5n7CwiR0V1wV/WHBxow4iyWSqWtEHC1qK+Q0olL2WFPdm7FefzCLHx3EYOBPHAE1lPRSNAOtj60P2lw6jEpOjecDnNnwd8Gl2eVZmBPdv2AAMd9LqaQGWDeluXrec2qzt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729017832; c=relaxed/simple;
	bh=9VBM2LdEi+CU/nqvrF7JLbTPBG9nPddaxEo2X7/h90U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=al2cyqTPpnwXM+KkzzjAX/W+WGPW17wO0Pv2bPOGHjzwKOrkRuBhFJvxo656vCqshcCWpI1J/vzlRA+ZIlwgcUSQK5sG2/pdxenFKToUvs/ZcKCZcL2LQ00HHr5E9NXveqeYGoswZaWT5juSEU4cUj2a6xohpr8t1Yu+48F6iU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0uYgUDFo; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f53973fdso123213e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729017829; x=1729622629; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9VBM2LdEi+CU/nqvrF7JLbTPBG9nPddaxEo2X7/h90U=;
        b=0uYgUDFo6WaLs1YhErf6qkDubY18x3vaqLkPndf0u4iVH0EaO0KO4WSP5bNwXoFkGf
         eCb6Vdp0241y3NOmOEyhxjtRRDtH+uJ3EIukVMSnMVEFUj7EyGtDl5ghmfPEFSz0pE6U
         Wm6RqNHNz+FwyIhHw4Xx7nvJCMcqwb7rIwukSW7yx2ViXOq7cAR9SIuX5cKLvDxXmZhC
         5aoSTO2eX2jLU6qJd0gvB1GGWd6Xx5AvI2DWLTVIMPGAjJjG+RU47eJkT1pvExPIXxqT
         J7G/mf889ynFD9jQBWezbb33ido2lvaqvKrmRPciIe7eNh4j/OsGYYmx1JznlNuTS7w2
         7dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729017829; x=1729622629;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VBM2LdEi+CU/nqvrF7JLbTPBG9nPddaxEo2X7/h90U=;
        b=rtlfAgo9u2H3WmQTXjyJ+XhDWWrWwdYOoda/4dbYSJJuEp/fvvlrxuo+osmBfFxE2A
         DPHWeAwk/FvS6rspdrFLSFAktx9iZJLX1uqwDbE4vj5nlf8tLWS6QOZ5hyPTHs/OisJk
         2zbV6VDoOVDQBxB6+fyLbl0cd9go06E3AZReGE0HPrDuPz675npYcMLC2YnBJQwL5kY/
         mZInd65v2yQNs3JnAlorfXj+yDw9ky0hTLHiDsVlivai7f3zPsu7y1mdDdK59DHArF2g
         BGPdCN26U+x4nwbkzG57W3DbJUGbEw6PM9MyjWx2tgwkO1L5+K6AWBOSabQ+vNRqgtn2
         sliA==
X-Gm-Message-State: AOJu0YxgvEyjPII+wW2chcqxKglaAU9gSMOpD79jnathDvmfZRRBqWDh
	W3PtifaQF896ItoF4mi8hFmFjRgmpYSVhDHPRDaueYPW/tssjU2KE2OTp8YDTwE2hguqYdidowS
	nY1aWTzprsJvHV7UH8Uf51Z6QFx4mFH1D9//+YyVTLKq+lc8rYGQ=
X-Google-Smtp-Source: AGHT+IEexbPdEquK1dUUAsJGRGjxqvcalUnkd0OAIFlTDmXnWqonbndNuMtMo6DY+zoIR1utuV0CQApMt3cfu9F+oHE=
X-Received: by 2002:a05:6512:6d0:b0:539:e5d7:d7ff with SMTP id
 2adb3069b0e04-539e5d7d939mr3582345e87.11.1729017828773; Tue, 15 Oct 2024
 11:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Oct 2024 20:43:37 +0200
Message-ID: <CAMRc=Mcxm+SYFZzAntU6G-2YGxQ8t3eWc6Qwt3gcdbi=8N0E1g@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.2-rc3
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I tagged and pushed out what I think is the last RC before doing the
final v2.2 release.

There were a couple fixes for memory leaks and some build improvements.

I'm thinking about doing the release next Monday to have the following
week to iron out any creases.

The tarball and git tree are in their usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

