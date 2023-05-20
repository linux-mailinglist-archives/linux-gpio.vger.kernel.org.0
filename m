Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03FA70A4D2
	for <lists+linux-gpio@lfdr.de>; Sat, 20 May 2023 05:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjETDL7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 23:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjETDL4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 23:11:56 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B08FE54
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 20:11:33 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae3a5dfa42so28760275ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 20:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684552293; x=1687144293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFxL+xvj5ULYtAwst8vctQ8zilxx0w/pyvqusSdRs2Q=;
        b=jumcdiVi9NdRp852gr0IIZ2Ok9s3M0b9fFHmHUroaNTWdsVLvfw94pKxoruEfJvHxZ
         ZS2RlWBI0Sb08aVGP2BkvL0aPJ/T+fe+/73/SvlqYXHTnFiGFjARCRFt+RVl5++0BAcc
         517+09QjOw8oBIxBOTzCAHiRWI/xXta9TTNbLzpwi/gumJEFnyvpYpaRNsKxu/BrG9oM
         OKWuznChDatKj2bc90gfM71xNPgxcWXqIUhJaYCqWCaCimlekq1ZmyTvD4NhfI+xScQs
         1N8xdbh9J8zrYHfR+Bjy/LLAul4wZnsrFOZaUrNEH4Q/wIRGzXvvVVU3i+GPMVG7smpe
         vk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684552293; x=1687144293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFxL+xvj5ULYtAwst8vctQ8zilxx0w/pyvqusSdRs2Q=;
        b=B0fuitPIblAD/QE5Gm3yhAJdhqdbkYb7RYGKNeol4cwQMgtN6coSx760nqvQQD8+1p
         gqnPX3hqNeT4nszCRrUxlvAGL6WdgrB2CWLJqJVRQOvahX2H2N0PGI5Na2G5sspkbf4Y
         K0Votu9HuRORJkIXuNiBBzLE1+inKnXcG3uD3VmBaGKHpYUbgtycq8dzCFtwKi/TdDP8
         hIALvBWCl/bjZYDBydKpQJ4X3iEMzEjWUzULDLnRz9B8c3jCgfpBxeun35gHysbC4YgK
         jqirH1PDVOo2OxGi1lvXPYBxa6u4VYsHQYJxXqv2PkPrZnQzgT85SjOoU59t5U1eg6Bc
         4Zhw==
X-Gm-Message-State: AC+VfDxoEuyIf9OylK9G+5p47C6Xxi2k3g6vD13XoojAcbR8ehz4Ox0A
        oCJYG/e/iQAs0oTK2VeD65xpKmQl4IA=
X-Google-Smtp-Source: ACHHUZ6I1nkg7b+MHHaGTvu3ysdc0LXQaG7fqMG7tPGs9Wn6BIC6roe3qLZQVctT5y6cMeEla9tc1g==
X-Received: by 2002:a17:902:e9d5:b0:1ac:8cd4:a82d with SMTP id 21-20020a170902e9d500b001ac8cd4a82dmr3911077plk.27.1684552292693;
        Fri, 19 May 2023 20:11:32 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id iw10-20020a170903044a00b001ac2f98e953sm331303plb.216.2023.05.19.20.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 20:11:32 -0700 (PDT)
Date:   Sat, 20 May 2023 11:11:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [PATCH] README: provide more info in Contributing
Message-ID: <ZGg6YP/4a2IuGfqE@sol>
References: <20230520021509.12135-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230520021509.12135-1-warthog618@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 20, 2023 at 10:15:09AM +0800, Kent Gibson wrote:
> Add more detail to Contributing to make it easier for new users to
> contribute.
> 
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Bah, ironically forgot the [libgpiod] prefix.
Sorry for the noise. Will resubmit.

Cheers,
Kent.
