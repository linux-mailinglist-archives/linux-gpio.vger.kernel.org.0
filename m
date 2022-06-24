Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF9C559395
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jun 2022 08:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiFXGh3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jun 2022 02:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiFXGh2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jun 2022 02:37:28 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0DA609E2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 23:37:28 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id h187so718026ybg.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=MUDd76TinUcA5JyTPJBAHn1VumWVzYjA1fKwU0h/HzI=;
        b=I4epz1r1z3reM0GCIZ7eHkK/s0Y/Yvb3mTSYmYKCn1AH0mvs1hHnTY0xdA3SqGcmi2
         g6UYZyTjuvYzVFCLdws++Uvo4GXxJXlDjQ8EyTlxSGygoWub+1d6CC4/bG9nK3O808S/
         KblNRHzS/o9n6Q1kacpJAvKBsFriwMzWQ0elfKmH57YNtLFCZo2Saetk2bZ8LKWrA99t
         54fdpOqjdr5ieQN9/bWOslSNt+gz/+MhJxyK8l8z0pXXSKOhNxq8ZH3l6U+GsRBmygaZ
         BVBHwd3iMX+pWWoKfsGstjSNcwAXm4wbcUUhzQlCGskBxPTdec8zuvzyoEtxuiDHru8e
         YzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=MUDd76TinUcA5JyTPJBAHn1VumWVzYjA1fKwU0h/HzI=;
        b=AiJnRLiuk4PbQE+LmNLUJXOgCLy9kmBYIghsmZVIKXa9hI0O+8nGKiW4Wzl1xpIyLm
         98s06q4DYvXFBDqZp2xCQD12Emh7H0TaHFS2irzqKDA85Ytnx28X77AGT4qPbV2ZVvID
         OUG0fnn5Tzvcj38agKsHRBX8j/4F/elzKoTkuO6D6cjjve42jWvYdd5DOjkStgdD6TlY
         uNXlkownek4kz2YmubzjniXdNf4cG1O99CJ0ceO/27+QLtD6mxtIAa/aeCLlx750lfQ7
         lJoh+55NMwHQk8ePrsZoFeZ4khG0o/hoEORtLDpxRWPVqfuWetfO0akt6J+ETrUP58rI
         dXKQ==
X-Gm-Message-State: AJIora/VGaTYr4sxpCqvPdrCpxP9PwbNyqqqxy/zT19esftpBBmVAbT6
        I0h3lU6wlImVCdqjRV32mZDmKRLqqrxwVPXqcCQ=
X-Google-Smtp-Source: AGRyM1txnXidhsfFaHEMApcMiK1ZfP8B7i0ZCWRFokZ96Aoh5TBM5fgiplNVVwCjmaxYeZHryJTLw0YDfg/DQJpRVyA=
X-Received: by 2002:a25:8801:0:b0:664:2e8c:dfe with SMTP id
 c1-20020a258801000000b006642e8c0dfemr13714648ybl.86.1656052647452; Thu, 23
 Jun 2022 23:37:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:e248:b0:2df:3cad:16e2 with HTTP; Thu, 23 Jun 2022
 23:37:27 -0700 (PDT)
Reply-To: marykayashsmm@gmail.com
From:   Mary Kayash <johnradke12@gmail.com>
Date:   Fri, 24 Jun 2022 01:37:27 -0500
Message-ID: <CAHEW3F4+bSmsx-7L=vz26CMJ-iEYuCGrbyY7JDCOYn+SFu++Dg@mail.gmail.com>
Subject: Dear In Christ,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Please I want to know if the email is valid to reach you.

Mrs Mary.
