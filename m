Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9176D672568
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 18:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjARRqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 12:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjARRpz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 12:45:55 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BF539291
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 09:44:15 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id k13so5048529plg.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0SrMM+HWAEdJB76voGVpyhiUzJlXWmxirZQzb5pGe9E=;
        b=baodVweo8Q04xEbmxaMK1+EuW1rZ/M1A1xchZZfo2QlcB45VsU4swJheoLO8AFs1Yf
         CD2XpW7aAZMVTmn26HDxz0sCfsRBKAn4Y9hSHW9EL5pQBLUiZShQXtw1MS8A29sHZUoa
         QHRPhnVWfzZsdSbn65hs12ka1rbRfMYVIpjX8/Xe8HAbbqUcNxs48O8mOItdG4M7Z+x+
         TVwc2qZk6tt4xj7v0ewb4WlppVAnnOP06ndZT/HdoTFXO3WZwpRbGpdHh6NcoiSJsUA6
         cxnbpeiLSb5gv/lpTWEaw7xokr5mrsm2DO+m1C3Eeb75+2mWIU3cFnA6hn7aNrrHuatg
         XPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SrMM+HWAEdJB76voGVpyhiUzJlXWmxirZQzb5pGe9E=;
        b=TUVOIqDCt2k3QcU6cqBL6LG2+O5mupM6WSsd2WFdephIwIdukUmgBnIcQpHeBsfqrA
         +AFJh+ixXmTwj6mYM21M51/IYFNUjwbqlz1u9So0/DPTzrbNk5nUfab7Ngj1un7KzQqS
         H4y7Fy6hQXN3ZgfzUBBHrkdGWFkBuO+UWaV9svrW9t7oSQqvrwPyPgzLU9LBud0+oLFB
         nMouDq76yAK0oQIeW9Zy+gj+U/o0UEyhcy6CstDArPHsXTgQedl8ZxObQN0mCBK2UNTv
         6Uy0Oxr5E0vOU3qnaEScXOlLoInHA+ked1Sm6xHc1dxNOQsYGfnWeYK8F6g6G6xT5b/4
         B86Q==
X-Gm-Message-State: AFqh2kpHCNhdHCYqhQ51l8XNS++eL+MNNHChY5dN+LTGB3s24djrazTg
        85f1rPwBl8cbL8k31sbSP5cIk1YuNte6Tlm+xTxFGsykH6M=
X-Google-Smtp-Source: AMrXdXvbFrmGqlV5rnpz7eciytfaNfWpBxTJiFTiuoESpCKZihXBtUZLTBwJSrqqztcFmE7a3/sAz7uFv+aWQWKeCbw=
X-Received: by 2002:a17:90a:9413:b0:229:81a7:c5a7 with SMTP id
 r19-20020a17090a941300b0022981a7c5a7mr873214pjo.76.1674063855186; Wed, 18 Jan
 2023 09:44:15 -0800 (PST)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 18 Jan 2023 14:44:00 -0300
Message-ID: <CAOMZO5Am2Zm7vwk_8ey_qx0dhcONV4WzPk1aDxvkvxKi-2dhrQ@mail.gmail.com>
Subject: libgpiod: Using the -a option in v1.6.x
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On master, there is a useful -a option for gpioget:

--as-is - leave the line direction unchanged, not forced to input

I am running libgpiod v1.6.3, which does not contain such an option.

Backporting this feature to v1.6.x did not seem trivial.

Would you have any suggestions as to how to add this option to v1.6.x?

Thanks,

Fabio Estevam
