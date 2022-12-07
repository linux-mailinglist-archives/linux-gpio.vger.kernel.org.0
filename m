Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745126458D7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 12:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiLGLVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 06:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiLGLUi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 06:20:38 -0500
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCF32A700
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 03:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:
        References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=X05oVxjtN5DABptkDqO7ehiW6fxqZfnhUcK1xSxmjeQ=; b=fRTc/30VSI/LPsemqq/7QaF8rC
        +G+hVfN3s1jpBuO9joFTibGjeziNJY5mU1ZtlfCbj54QEUjB2M9jCqlIbgsMn/DYuB7LlccYi4orA
        FtRH2u1N1RAlsDFjUyy1pf7TsZbXIlMbR9RK7xS3NxR7BVUGJQqG1joEugRokIoMRuGmllURKBn3h
        9uFMXO8dT973ZFY2Aubc32xbPyRC99FzqFtk8Tr+6Mtg5rXWnYPzhNpVHfYJW4qJfUEBOiDnSQNrv
        YWyA7LSxFIoZWLiVHSLxhK/ietpjnD3WGQuzsdQVmf9dP5Ew+dg6A3fYIvHQrfHdW9k6iXoefiDjE
        Y4D3e8zQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <esben@geanix.com>)
        id 1p2sTa-0002F8-48; Wed, 07 Dec 2022 12:20:34 +0100
Received: from [87.49.146.167] (helo=localhost)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <esben@geanix.com>)
        id 1p2sTZ-0000ti-Tr; Wed, 07 Dec 2022 12:20:33 +0100
From:   Esben Haabendal <esben@geanix.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpioset: fix memory leak in interactive mode
References: <f36e4eeee8c5bb96cddcad31a3762c10406a99e9.1670316057.git.esben@geanix.com>
        <Y5BczAGN78xiKgDp@sol>
        <CAMRc=MfdAWh6-Xsmrvugy8wNEFeXR9knX4i8fwFuCfRbBcJ9Kw@mail.gmail.com>
Date:   Wed, 07 Dec 2022 12:20:33 +0100
In-Reply-To: <CAMRc=MfdAWh6-Xsmrvugy8wNEFeXR9knX4i8fwFuCfRbBcJ9Kw@mail.gmail.com>
        (Bartosz Golaszewski's message of "Wed, 7 Dec 2022 10:41:54 +0100")
Message-ID: <878rjj1mv2.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26743/Wed Dec  7 09:17:04 2022)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> I applied it with the change suggested by Kent.

Great, thanks.

/Esben
