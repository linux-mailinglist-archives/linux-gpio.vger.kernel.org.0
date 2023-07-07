Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3E774AE69
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jul 2023 12:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbjGGKCm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jul 2023 06:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbjGGKCO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jul 2023 06:02:14 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11AD190
        for <linux-gpio@vger.kernel.org>; Fri,  7 Jul 2023 02:59:38 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5768a7e3adbso42498447b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jul 2023 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688723977; x=1691315977;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NdiupA6cBTfp2T4wmKkTrqOertN7BIFSXZbmCnqIkpY=;
        b=pcvoNyrh+Tig0Piq7Ln6XTxbqqf2D4+Zpy3ZqmpsipUYis+Ns56l2Lbg1zvHH9/XuY
         tKPhWQLPYOZJLCSAnIu4TcFSvDw/+Tm7HO5jtL/xzSOWiEAwrew+sy4YdA9/imxCJZ3e
         mnnYFIs7chL2Mfc9qvyYYWzGpF3+daQuk5Mu/PUMyZUbajwTbAAChingao9sSmQFc595
         75j5+6R8FkjFRa0wtPGAo/ygH/bJL5P5tT8qZmmqfNkH/OxrPc52nduoU4OWJMcLM9E2
         R0ZS5/D9aKhpJr6xz2yWN0xxiNd4Fs8PU1d5goBKt6PEpd/WU/YP0ucoCkA/lXHe7+Sk
         6V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688723977; x=1691315977;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdiupA6cBTfp2T4wmKkTrqOertN7BIFSXZbmCnqIkpY=;
        b=V5J9lhcuQ0d4+rd5jLA6mutfqT9F/5NA3FdNka486d9EtvjwYNmt0aQUXAgdtdQFKk
         BKWfox49BSy6+rEFW34kLvt17m3Rn9UWEvCECNLcbgOCfCbulxoi+FGUdtBfoHrvJzNx
         0P5KsRGdTZlZpY9M0UDwFq4NX4zrkZ1y6aUPvbm/Eh1TaVN1oU9Hth1zUgP5K3waW2Pp
         +L+OmoP+CLeUeTwxf0dcLIgLOvpwyNPbfqYtj7eKjRejIizaN46tKuRCHba5qmp/S9Mx
         R+tvDQCg4I72mHZx4p8kl0a6ZBVcsN5PiaSbX8JUEGqCf1+7Kce//QrJV4Av4WvYbD0L
         f5VQ==
X-Gm-Message-State: ABy/qLY2B4L21v9/GWViS2pZ4VBupbjg9rUyif+IAeMEwfZ3GWaWUtHg
        uUkFXfCWyEh3KujjEDns0C25/z7SLWw4YHo6sLM=
X-Google-Smtp-Source: APBJJlFTsRNPPXwVgdJaIOLcQ2T7z1uqKUEWsvjamPXFk2NHvwCopxZSZ4vgxj44Tj2drC50+eJGIgOqicRzzmwi2ok=
X-Received: by 2002:a81:9255:0:b0:56c:e480:2b2b with SMTP id
 j82-20020a819255000000b0056ce4802b2bmr6198052ywg.12.1688723977036; Fri, 07
 Jul 2023 02:59:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:7194:b0:30e:1832:1192 with HTTP; Fri, 7 Jul 2023
 02:59:36 -0700 (PDT)
Reply-To: mariaelisabethschaeffler.de@gmail.com
From:   Frau Maria Elisabeth Schaeffler <edwinsundayagha@gmail.com>
Date:   Fri, 7 Jul 2023 10:59:36 +0100
Message-ID: <CA+Tx06Jx_DK97TQyNknx_dkijRm5opLMg6j53nLZQGCkEoJZiQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=20
Sie haben eine Spende f=C3=BCr humanit=C3=A4re Arbeit erhalten. E-Mail f=C3=
=BCr
 Informationen: mariaelisabethschaeffler.de@gmail.com
