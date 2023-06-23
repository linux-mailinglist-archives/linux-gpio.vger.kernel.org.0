Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F38D73B22B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 09:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjFWH6M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 03:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFWH6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 03:58:11 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D588B1BE4
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 00:58:09 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fa7eb35a13so189285e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687507088; x=1690099088;
        h=in-reply-to:references:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft+LLys9aUYnl8UmBB0+3zDM4ECgwYDOFl0m+SLW2rQ=;
        b=xTaaroFeblDKQWcGIXMDuvEqxU3IlaxjRfXpHdUZC5gFJD+hhjdhIKx+KCrMMfb8QU
         EDWQBNwh5z1n0vsZ91J9HKUtFYxUE2gp4fyENg9npNVx0ooogJAhNpmjuTadu0t5bOWl
         JXkhyMPiW6e+UK79ScUJy4ns1Wkl1KMtJCNJh6s9PQTkQdvevvd/Dkdqxo+acqsiMW/B
         CptlxvnVt4k/gBimS+oa2XxbwUTnVk+pJjNRznOyfu85VrUFCAq4FkCoJCHrWgmjJjEq
         LQhXKU6iDDkKjSGUynSvd9yW8DkvVwy3RNh9zsx2mLLcz738Cyc1l1YUmyQkSZg+TOQ4
         j8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687507088; x=1690099088;
        h=in-reply-to:references:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ft+LLys9aUYnl8UmBB0+3zDM4ECgwYDOFl0m+SLW2rQ=;
        b=Uftz9LoJATHf3dOwvvUh/DhV083BEz2shpHWmFanVP8oVCBme8fcse/+IeMmSPyyQ8
         F3W8vNUqlztCy8fiGGqTcXvHVDxfeeg1lI1yCSz8KDawqAI1g8IsE6chFpxExb6c51EY
         SswoAaMrlKqNs2jT/0eECONuAZ+zC9tgnJPO6UXuFtMZhl5hArXDSeiJFggE6iTEfMST
         ReUH9QjV9ERWJQgFok+LRmJolkOAss/MnFbHzeRK8AbXJAyWXIGNVvxjx8k0llNLqmhj
         IfruQ9/yEFcPx6w3KKZO1K/Hq+FOxlJR6lVr486sw8ORGh4gQ8l6j84QdfsJxdbKlR+z
         uXfQ==
X-Gm-Message-State: AC+VfDxpRsACmDWdzrtv3WZvXt8zmqte69LxjSHwzkHII9r2nGU0rxWc
        fcqpZjrFqTNWoPq4mRVinIrXww==
X-Google-Smtp-Source: ACHHUZ635A4225j+9jaz1DTRXSTMf418i7faAmaj2m3AaysmvXx/rQKPXLdhN+Dp3T1KC8r+ft8bdA==
X-Received: by 2002:a05:6000:151:b0:312:74a9:8267 with SMTP id r17-20020a056000015100b0031274a98267mr3217884wrx.9.1687507088463;
        Fri, 23 Jun 2023 00:58:08 -0700 (PDT)
Received: from localhost (i5C7405EF.versanet.de. [92.116.5.239])
        by smtp.gmail.com with ESMTPSA id j2-20020adfe502000000b002ca864b807csm9067446wrm.0.2023.06.23.00.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 00:58:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 23 Jun 2023 09:58:07 +0200
Message-Id: <CTJVC5VV5LSK.17NPK1QQ5PG0H@fedora>
To:     "Kent Gibson" <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 7/8] bindings: rust: examples: consistency
 cleanup
X-Mailer: aerc 0.14.0
References: <20230623043901.16764-1-warthog618@gmail.com>
 <20230623043901.16764-8-warthog618@gmail.com>
In-Reply-To: <20230623043901.16764-8-warthog618@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Jun 23, 2023 at 6:39 AM CEST, Kent Gibson wrote:
> A collection of minor changes to be more consistent with other examples:
>  - capitalize comments
>  - add line offset to value outputs
>  - drop comma from edge event outputs
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
