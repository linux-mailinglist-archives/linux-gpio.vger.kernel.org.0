Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA7F70EDDB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 08:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239409AbjEXGcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 02:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbjEXGcI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 02:32:08 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA341184
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:
        References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=jQR699jNVxgcrhQ93JJ86JYYb6/P+B9KOait0sgd0xI=; b=UrhQPqcdcqI6EBiPIE2TaBjNIn
        V5oesuEPM0stpqo3VO1GLCgBcGL7dgGqqvKR3lyh/QZpxKfCU35X6JGU2w1YVzOtz87VAT8tasbhs
        qYvUsoiebjhlMqXSPHPDb1Ys9FxsilZ7x98iXSB7jJvCbMrGhvP9ncmE3B6baXOn6ALEm0E1tUuIh
        H2Ngzvz0KA1OfUttDJn4bxgkNhjKBUEcHpFoXndms4BA+Od7ZID/psUX2P7K1mjCBClv5Jp4eHLWJ
        O0i+YOOo1UwxOGQ3ehOpKQN2j7YJv/C3hjs34pwpducczOmKedgUb+pGx9T/YvhQq4wVDzpXh6z+1
        0calbZbw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <esben@geanix.com>)
        id 1q1i2T-000Nef-1e; Wed, 24 May 2023 08:32:01 +0200
Received: from [80.62.117.0] (helo=localhost)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <esben@geanix.com>)
        id 1q1i2S-000OyT-R1; Wed, 24 May 2023 08:32:00 +0200
From:   esben@geanix.com
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH] gpioset: only print prompt when stdout is tty
References: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
        <ZGzdaJ/wBSUDsJdU@sol>
Date:   Wed, 24 May 2023 08:30:33 +0200
In-Reply-To: <ZGzdaJ/wBSUDsJdU@sol> (Kent Gibson's message of "Tue, 23 May
        2023 23:36:08 +0800")
Message-ID: <87pm6q9r7a.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26916/Tue May 23 09:22:39 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kent Gibson <warthog618@gmail.com> writes:

> On Tue, May 23, 2023 at 03:54:41PM +0200, Esben Haabendal wrote:
>> When gpioset interactive mode is used as intended, as a human controlled
>> interface, stdout should be a tty.
>> 
>
> Yeah, no, the interactive mode is also intended to be script driven -
> checkout the test suite, gpio-tools-tests.bat, as an example of it being
> driven using a coproc from bash.
> 
> Removing the prompt would break the handshaking with the controlling
> script - that is how it determines the slave process is up.

I see.  I use a process supervisor, which should ensure that the gpioset
process stays alive.  And if a client writes to the fifo while the
process is shortly down, it will pick up the request when it starts up.

A proper gpio daemon would of-course need a request-reply mechanism, so
the requester can know if the request succeeded.  But that obviously is
something slightly more involved than removing a single printf() call.

> I'll try running your patch through the test suite tommorrow, but I'm
> pretty sure it will break it - IIRC the code you removed was put there
> precisely to get the test suite to run.
>
> Have you tried running the test suite?

Yes, I have now.  And I see that they fail with my RFC PATCH.  The use
of coproc is obviously not compatible with it.

But I cannot help feeling that the use of coproc to drive a
command-prompt interface, while well suited for writing a test for such
an prompt based interactive interface, it is not how you would want to
talk with a daemon.

>> By leaving out the prompt when stdout is not a tty, gpioset interactive mode can
>> be used as a really simple deamon for controlling GPIOs by connecting it to a
>> FIFO.
>
> It can do that already - just direct the output to /dev/null.

If I direct the output to /dev/null, I cannot see what good the prompt
does.  I am directing the output to a log file, and by sending "get"
commands to gpioset, I end up with a log of the gpio states.

> Which you would need in your case anyway - the prompt isn't the only
> output - try piping a get command to your daemon and see what happens.

I know.

> This works for me as a simple daemon script:
>
> #!/bin/bash
>
> pipe=/tmp/gpiosetd
>
> mkfifo $pipe
>
> trap "rm -f $pipe" EXIT
>
> # as bash will block until something is written to the pipe...
> echo "" > $pipe &

I believe this is not just needed because of bash.  If you don't have a
writer on the fifo, the gpioset will end up in a busy loop in readline
until a writer appear, spamming a prompt out on output while eating up
100% cpu.

> gpioset -i GPIO23=0 < $pipe > /dev/null
>
> Does that not work for you?

That is basically what I do.  Just output directed to a log file
(actually, a pipe to a process writing to rotated log files) instead of
/dev/null, and then no prompt noise in the log files.

Anyway, what about adding a new CLI option. Either something like '-I'
for no-prompt interactive mode, or '-n' to be used with '-i' for the
same?

This would make all existing usage of gpioset work just as it is now,
but allowing use without a prompt when that is desired?

/Esben
