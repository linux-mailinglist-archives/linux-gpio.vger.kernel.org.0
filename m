Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F608751F90
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jul 2023 13:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbjGMLIt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jul 2023 07:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbjGMLIr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2023 07:08:47 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA4A211E
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 04:08:47 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-55779047021so360183a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689246526; x=1691838526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0SCl9wtNC1xsNq6o1Hy/kDLjNTTfMjAPYAoq37IZiQ=;
        b=SxDGEL5mR4ZVkowiwd39mbb6VyFO9zWtVAfelpzjWrPK7NQEbCigxE5p0mlUBOX66P
         aX3IcKPfuPVomzim+TkTmBIAWvRqkB8ZfwPZMVjQazZZabf7ZRX//CbP4ZdI24O41dic
         8sSPAnqeHzuyAh3z9sX9UyKDCEuAKk0vCHlDEwV0JZUoB6OnbTcE6RLBgEiLZ66iJl02
         NZBxLtFcrJ6fvcGD+m/nf97NElF/G+Jp2ZRsHhMK4Q1qv4UB0olVS1AjVCxLihTQOdWQ
         LYLqfT4I1znHU9dV2SOo3gzt+/xLWn8z0kaeyxVXk/UQ2sy0LTVwsRkmjn2E8oIXlNUE
         O45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246526; x=1691838526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0SCl9wtNC1xsNq6o1Hy/kDLjNTTfMjAPYAoq37IZiQ=;
        b=J9tHzb/6JHttDFDlfs1HfRYMok38eybFANWN+K7iBlkzfOo+LmBtmvq2ICLkK7EYD2
         gHT38olz1KbFpoZ66cgy/F+7Xa+CN/otB1yRwbJILhD8/uO0ouLfa5j2uyYf8d+gSPLo
         dk2tk4Yx5ozkNus202lJv0B4kGGPzG9RSy6y1zlxFzQSM4PZ5L+vMC496xP3JRI1089U
         RhnNaYrbMLhXWs/IbMcyrLO7oOFpeIk1C2Vvk/u6JFtJ4JpOXIXmnOascs1tFhGvX6q8
         I7JIgZp8+48VYa7UchdLQQetGxGO2xukvRjRA3rB5/jDSwjxM25T7BwISOWpdvDaxYAt
         XCEw==
X-Gm-Message-State: ABy/qLZ/bikNBzXCa1fpItuQv1/jfrIgjyvC6y2u1F1dZBFAAwSDqYY8
        3FYhrvZbdb+FGwx9FmEzc0rcqTlAsu8=
X-Google-Smtp-Source: APBJJlEgJOS4O2XkhmVwsTkW+GQBka9H2tmVUVj6SzdwBKyOpynaabQ0Ej9ww28ZAce5y8YL33D2OA==
X-Received: by 2002:a17:902:db10:b0:1b8:5bf5:543a with SMTP id m16-20020a170902db1000b001b85bf5543amr693440plx.49.1689246526342;
        Thu, 13 Jul 2023 04:08:46 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id jw16-20020a170903279000b001b8b45b177esm5632974plb.274.2023.07.13.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:08:45 -0700 (PDT)
Date:   Thu, 13 Jul 2023 19:08:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Ullrich Lucas, Schrack Seconet AG, Entwicklung" 
        <l.ullrich@schrack-seconet.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod]: non-exclusive use of input lines
Message-ID: <ZK/bOWcl0x/1zIY2@sol>
References: <1337f994e3ad45f49dc86787bcb3a019@schrack-seconet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1337f994e3ad45f49dc86787bcb3a019@schrack-seconet.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 13, 2023 at 09:24:03AM +0000, Hollerer Franz, Schrack Seconet AG, Entwicklung wrote:
> 
> I have several processes (one of them is a shell scripts, others are
> C/C++ programs) which need to read the same input line.
> Is it somehow possible to request input lines for non-exclusive use?

No, it is not possible.

> If not, is this a feature which will be added sometime in the future?
> 

No, there are no plans for such a feature, AFAIAA.

The solution is to have a userspace process monitor the line and share
the value with the other processes.  How best to do that is up to you.
A simple approach would be to write the value to a file.
(which might be a useful mode to add to gpiomon??)

Bart is working on a daemon that may provided shared read access, but
I'm just guessing.

Cheers,
Kent.

