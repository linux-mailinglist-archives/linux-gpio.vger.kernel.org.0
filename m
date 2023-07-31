Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9AE769654
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jul 2023 14:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjGaMaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jul 2023 08:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjGaMaC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2023 08:30:02 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75854C6
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2023 05:30:01 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31765792c7cso4774389f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2023 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690806600; x=1691411400;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd9oC+qN9vojxTpZDloVHGiCls3SDiZuksEePnvnriY=;
        b=BhyQpG5IAUPvbpyowAdpckBB1IjjFc2SrYNq1JPDr+XjKK16HpI6XDASMu61OgDS1s
         RJO8FXq/UmrFCczSChoeOxIWRRivdRj70yjD2CWlYoXL2/w71osGmsdXjvJk0re87dJt
         bB0Z6hheQ+A5OeCO2ubGut58ePfQ8Cb7wdw4cvKzgNYUd892+9qN5s+zrNwEnW2oNNIG
         5Lanjknob9jYstH1bSeMczcnvgOK+d0lxheHnQPPktLr+2c2NfL+zMM9Ejc8QK3HKCf7
         25IVbVcDj4APo+osaH0v8mnKKh2GtUmzk952deW0NZpy5+cnRANG5Wo7mCpOngUBDEvc
         s9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690806600; x=1691411400;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bd9oC+qN9vojxTpZDloVHGiCls3SDiZuksEePnvnriY=;
        b=S1lNyZ50Pm+1m8gct0Mi1qayPnuzp0b74CSEJzI8opfBCR9z2WiVNNOqaT4YNJ0B5u
         mL0a6xefzqZ8ikWjkgVpP6quQPGXlJB77+4wDyDGQDwEKW8GeXmEUsjEsh3+Je/5mxUM
         N0fQdvoe4Q64Yn3nd1V2NuTMURKBUC7SanVXqrbJAMXUki4bDzSacVyReY2+0NLV5n/z
         IVJPTSw0JaV4cF7SMNpBXwNX9CBy15K9u7xukyR3Sr5OYMzJN7XjmuxKs+2Jql6n6TN5
         cP/WIrWT7IYpNrVhLKStkJNpCHQjJ8PwYVFsunUWsmNBEg3U+LIgaSNnhcMZ4SBcds8I
         prEA==
X-Gm-Message-State: ABy/qLZGFD6M6SXpxqmTSbF2wDN+ppc4icIItkJnxHLJT4pSwLmOsq40
        VhxQknBScoHCbvQHSPGhuJBcAS0373iErnkjqRU=
X-Google-Smtp-Source: APBJJlExfAnTgF4NmGDIE2qDHirQQR/Fb2oq4IRitUZWcuIuycKGcZS0qd2Mm7otFwEEVJ5U5BxpdrKExDIHZCZSAFo=
X-Received: by 2002:a5d:5913:0:b0:30e:19a8:4b0a with SMTP id
 v19-20020a5d5913000000b0030e19a84b0amr7682060wrd.2.1690806599638; Mon, 31 Jul
 2023 05:29:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:f6cf:0:b0:314:3929:2664 with HTTP; Mon, 31 Jul 2023
 05:29:59 -0700 (PDT)
Reply-To: AvaSmith62567@gmail.com
From:   Dr Ava Smith <monicabrown671@gmail.com>
Date:   Mon, 31 Jul 2023 05:29:59 -0700
Message-ID: <CAFoLVbd6w4KArpHbLBY+RtyBW==QJ=voxHRXxcZgaW_NRjxAGw@mail.gmail.com>
Subject: From Dr Ava Smith
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Dear
My name is Dr Ava Smith,a medical doctor from United States.
I have Dual citizenship which is English and French.
I will share pictures and more details about me as soon as i get
a response from you
Thanks
Ava
